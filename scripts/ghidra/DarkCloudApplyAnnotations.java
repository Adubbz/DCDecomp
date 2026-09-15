// Apply evidence-bound Dark Cloud names, types, signatures, and comments.
//@category Dark Cloud

import java.io.*;
import java.security.*;
import java.util.*;

import com.google.gson.*;

import ghidra.app.cmd.function.ApplyFunctionSignatureCmd;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.data.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.mem.MemoryAccessException;
import ghidra.program.model.symbol.*;

public class DarkCloudApplyAnnotations extends GhidraScript {
    private static final CategoryPath TYPE_CATEGORY = new CategoryPath("/DarkCloud");
    private DataTypeManager dtm;

    private static int number(JsonObject object, String key) {
        String value = object.get(key).getAsString();
        return (int) Long.decode(value).longValue();
    }

    private static int flexibleNumber(JsonElement value) {
        return value.isJsonPrimitive() && value.getAsJsonPrimitive().isNumber()
            ? value.getAsInt() : (int) Long.decode(value.getAsString()).longValue();
    }

    private String sha256(Address start, int size) throws Exception {
        byte[] bytes = new byte[size];
        int count;
        try {
            count = currentProgram.getMemory().getBytes(start, bytes);
        }
        catch (MemoryAccessException error) {
            return null;
        }
        if (count != size) return null;
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(bytes);
        StringBuilder result = new StringBuilder();
        for (byte value : digest) result.append(String.format("%02x", value));
        return result.toString();
    }

    private boolean exactBody(Function function, Address start, int size) {
        AddressSetView body = function.getBody();
        return body.getNumAddresses() == size && body.getMinAddress().equals(start) &&
            body.getMaxAddress().equals(start.add(size - 1));
    }

    private DataType resolveType(String spelling) throws Exception {
        spelling = spelling.trim();
        if (spelling.endsWith("*")) {
            DataType base = resolveType(spelling.substring(0, spelling.length() - 1));
            return new PointerDataType(base, currentProgram.getDefaultPointerSize(), dtm);
        }
        if (spelling.equals("void")) return VoidDataType.dataType;
        if (spelling.equals("char")) return CharDataType.dataType;
        if (spelling.equals("float")) return FloatDataType.dataType;
        if (spelling.equals("s16")) return ShortDataType.dataType;
        if (spelling.equals("s32")) return IntegerDataType.dataType;
        if (spelling.equals("u32")) return UnsignedIntegerDataType.dataType;
        if (spelling.equals("u8")) return UnsignedCharDataType.dataType;
        DataType result = dtm.getDataType(TYPE_CATEGORY, spelling);
        if (result == null) throw new IllegalArgumentException("unknown type " + spelling);
        return result;
    }

    private void applyTypes(JsonArray types) throws Exception {
        for (JsonElement element : types) {
            JsonObject spec = element.getAsJsonObject();
            String kind = spec.get("kind").getAsString();
            String name = spec.get("name").getAsString();
            if (kind.equals("opaque")) {
                StructureDataType replacement = new StructureDataType(
                    TYPE_CATEGORY, name, 0, dtm);
                if (spec.has("comment")) {
                    replacement.setDescription(spec.get("comment").getAsString());
                }
                dtm.addDataType(replacement, DataTypeConflictHandler.REPLACE_HANDLER);
                continue;
            }
            int size = flexibleNumber(spec.get("size"));
            if (kind.equals("enum")) {
                EnumDataType replacement = new EnumDataType(TYPE_CATEGORY, name, size, dtm);
                for (Map.Entry<String, JsonElement> value :
                        spec.getAsJsonObject("values").entrySet()) {
                    replacement.add(value.getKey(), value.getValue().getAsLong());
                }
                if (spec.has("comment")) replacement.setDescription(spec.get("comment").getAsString());
                dtm.addDataType(replacement, DataTypeConflictHandler.REPLACE_HANDLER);
                continue;
            }
            if (!kind.equals("structure")) {
                throw new IllegalArgumentException("unsupported type kind " + kind);
            }
            StructureDataType replacement = new StructureDataType(TYPE_CATEGORY, name, size, dtm);
            replacement.setPackingEnabled(false);
            if (spec.has("comment")) replacement.setDescription(spec.get("comment").getAsString());
            for (JsonElement fieldElement : spec.getAsJsonArray("fields")) {
                JsonObject field = fieldElement.getAsJsonObject();
                DataType fieldType = resolveType(field.get("type").getAsString());
                if (field.has("dimensions")) {
                    JsonArray dimensions = field.getAsJsonArray("dimensions");
                    for (int i = dimensions.size() - 1; i >= 0; i--) {
                        fieldType = new ArrayDataType(fieldType, dimensions.get(i).getAsInt(),
                            fieldType.getLength(), dtm);
                    }
                }
                replacement.replaceAtOffset(flexibleNumber(field.get("offset")), fieldType,
                    fieldType.getLength(), field.get("name").getAsString(),
                    field.has("comment") ? field.get("comment").getAsString() : null);
            }
            dtm.addDataType(replacement, DataTypeConflictHandler.REPLACE_HANDLER);
        }
    }

    private void applySignature(Function function, JsonObject spec) throws Exception {
        FunctionDefinitionDataType signature = new FunctionDefinitionDataType(function.getName());
        signature.setReturnType(resolveType(spec.get("return_type").getAsString()));
        JsonArray parameters = spec.getAsJsonArray("parameters");
        ParameterDefinition[] definitions = new ParameterDefinition[parameters.size()];
        for (int i = 0; i < parameters.size(); i++) {
            JsonObject parameter = parameters.get(i).getAsJsonObject();
            definitions[i] = new ParameterDefinitionImpl(
                parameter.get("name").getAsString(),
                resolveType(parameter.get("type").getAsString()), null);
        }
        signature.setArguments(definitions);
        ApplyFunctionSignatureCmd command = new ApplyFunctionSignatureCmd(
            function.getEntryPoint(), signature, SourceType.USER_DEFINED);
        if (!command.applyTo(currentProgram, monitor)) {
            throw new IllegalStateException("signature failed for " + function.getName() +
                ": " + command.getStatusMsg());
        }
    }

    private int removeSameAddressLabel(Address address, String name) {
        int removed = 0;
        for (Symbol symbol : currentProgram.getSymbolTable().getSymbols(address)) {
            if (symbol.getName().equals(name) && symbol.getSymbolType() != SymbolType.FUNCTION) {
                if (!symbol.delete()) {
                    throw new IllegalStateException("cannot replace same-address label " + name);
                }
                removed++;
            }
        }
        return removed;
    }

    private int removeInteriorAnalysisFunctions(FunctionManager manager, AddressSet body,
            Address start, Set<Address> retailStarts) throws Exception {
        List<Function> remove = new ArrayList<>();
        FunctionIterator iterator = manager.getFunctions(body, true);
        while (iterator.hasNext()) {
            Function interior = iterator.next();
            Address entry = interior.getEntryPoint();
            if (entry.equals(start)) continue;
            AddressSetView interiorBody = interior.getBody();
            if (retailStarts.contains(entry) ||
                    !body.contains(interiorBody.getMinAddress(), interiorBody.getMaxAddress()) ||
                    interior.getSymbol().getSource() == SourceType.USER_DEFINED ||
                    interior.getSymbol().getSource() == SourceType.IMPORTED) {
                throw new IllegalStateException("protected interior function " +
                    interior.getName() + " at " + entry + " inside retail function " + start);
            }
            remove.add(interior);
        }
        for (Function interior : remove) {
            if (!manager.removeFunction(interior.getEntryPoint())) {
                throw new IllegalStateException("cannot remove interior analysis function at " +
                    interior.getEntryPoint());
            }
        }
        return remove.size();
    }

    @Override
    public void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 1) throw new IllegalArgumentException("expected annotation JSON path");
        JsonObject manifest;
        try (Reader reader = new BufferedReader(new FileReader(args[0]))) {
            manifest = JsonParser.parseReader(reader).getAsJsonObject();
        }
        if (manifest.get("schema_version").getAsInt() != 2) {
            throw new IllegalArgumentException("unsupported schema version");
        }
        String currentImage = null;
        for (Map.Entry<String, JsonElement> program :
                manifest.getAsJsonObject("programs").entrySet()) {
            if (currentProgram.getName().equals(program.getValue().getAsString())) {
                currentImage = program.getKey();
                break;
            }
        }
        if (currentImage == null) {
            throw new IllegalArgumentException("manifest/program mismatch");
        }

        dtm = currentProgram.getDataTypeManager();
        JsonArray functions = manifest.getAsJsonArray("functions");
        List<JsonObject> applicable = new ArrayList<>();
        Set<Address> retailStarts = new HashSet<>();
        int skippedImages = 0;

        // Complete byte preflight occurs before the first persistent mutation.
        for (JsonElement element : functions) {
            JsonObject spec = element.getAsJsonObject();
            if (!spec.get("image").getAsString().equals(currentImage)) {
                skippedImages++;
                continue;
            }
            Address start = toAddr(number(spec, "address"));
            int size = number(spec, "size");
            String actualHash = sha256(start, size);
            if (!spec.get("sha256").getAsString().equals(actualHash)) {
                throw new IllegalStateException("retail byte mismatch at " + start + " for " +
                    spec.get("name").getAsString());
            }
            applicable.add(spec);
            retailStarts.add(start);
        }

        applyTypes(manifest.getAsJsonArray("types"));
        FunctionManager manager = currentProgram.getFunctionManager();
        int created = 0, renamed = 0, resized = 0, commented = 0, signed = 0;
        int replacedLabels = 0;
        int removedInterior = 0;

        for (JsonObject spec : applicable) {
            monitor.checkCancelled();
            Address start = toAddr(number(spec, "address"));
            int size = number(spec, "size");
            AddressSet body = new AddressSet(start, start.add(size - 1));
            String name = spec.get("name").getAsString();
            removedInterior += removeInteriorAnalysisFunctions(
                manager, body, start, retailStarts);
            Function function = manager.getFunctionAt(start);
            if (function == null) {
                Function overlap = manager.getFunctionContaining(start);
                if (overlap != null) {
                    throw new IllegalStateException("interior function conflict at " + start);
                }
                function = manager.createFunction(name, currentProgram.getGlobalNamespace(), start,
                    body, SourceType.USER_DEFINED);
                if (function == null) throw new IllegalStateException("cannot create " + name);
                created++;
            }
            else if (!exactBody(function, start, size)) {
                function.setBody(body);
                if (!exactBody(function, start, size)) {
                    throw new IllegalStateException("cannot set exact body for " + name);
                }
                resized++;
            }
            if (!function.getName().equals(name) ||
                    function.getSymbol().getSource() != SourceType.USER_DEFINED) {
                if (function.getName().equals(name)) {
                    String temporaryName = "__dcdecomp_" + start.toString();
                    function.setName(temporaryName, SourceType.USER_DEFINED);
                }
                replacedLabels += removeSameAddressLabel(start, name);
                function.setName(name, SourceType.USER_DEFINED);
                renamed++;
            }
            if (spec.has("comment")) {
                String desired = spec.get("comment").getAsString();
                String existing = function.getComment();
                if (existing == null) {
                    function.setComment(desired);
                    commented++;
                }
                else if (!existing.contains(desired)) {
                    function.setComment(existing + "\n\n[dcdecomp]\n" + desired);
                    commented++;
                }
            }
            if (spec.has("signature")) {
                applySignature(function, spec.getAsJsonObject("signature"));
                signed++;
            }
        }
        println(String.format(
            "APPLIED manifest=%d applicable=%d skipped_images=%d created=%d renamed=%d " +
            "resized=%d removed_interior=%d replaced_labels=%d commented=%d " +
            "signatures=%d types=%d",
            functions.size(), applicable.size(), skippedImages, created, renamed, resized,
            removedInterior, replacedLabels, commented, signed,
            manifest.getAsJsonArray("types").size()));
    }
}
