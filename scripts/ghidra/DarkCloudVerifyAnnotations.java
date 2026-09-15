// Verify persisted Dark Cloud annotations against their retail evidence.
//@category Dark Cloud

import java.io.*;
import java.security.*;
import java.util.*;

import com.google.gson.*;

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.data.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.mem.MemoryAccessException;
import ghidra.program.model.symbol.SourceType;

public class DarkCloudVerifyAnnotations extends GhidraScript {
    private static final CategoryPath TYPE_CATEGORY = new CategoryPath("/DarkCloud");
    private DataTypeManager dtm;

    private static int number(JsonObject object, String key) {
        return (int) Long.decode(object.get(key).getAsString()).longValue();
    }

    private static int flexibleNumber(JsonElement value) {
        return value.isJsonPrimitive() && value.getAsJsonPrimitive().isNumber()
            ? value.getAsInt() : (int) Long.decode(value.getAsString()).longValue();
    }

    private String sha256(Address start, int size) throws Exception {
        byte[] bytes = new byte[size];
        try {
            if (currentProgram.getMemory().getBytes(start, bytes) != size) return null;
        }
        catch (MemoryAccessException error) {
            return null;
        }
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(bytes);
        StringBuilder result = new StringBuilder();
        for (byte value : digest) result.append(String.format("%02x", value));
        return result.toString();
    }

    private DataType resolveType(String spelling) throws Exception {
        spelling = spelling.trim();
        if (spelling.endsWith("*")) {
            return new PointerDataType(resolveType(spelling.substring(0, spelling.length() - 1)),
                currentProgram.getDefaultPointerSize(), dtm);
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

    private void verifyTypes(JsonArray types) throws Exception {
        for (JsonElement element : types) {
            JsonObject spec = element.getAsJsonObject();
            String name = spec.get("name").getAsString();
            DataType dataType = dtm.getDataType(TYPE_CATEGORY, name);
            String kind = spec.get("kind").getAsString();
            if (kind.equals("opaque")) {
                // Empty structures may report a one-byte aligned length; only their lack of
                // fields is meaningful because they are used solely behind pointers.
                if (!(dataType instanceof Structure) ||
                        ((Structure) dataType).getNumDefinedComponents() != 0) {
                    throw new IllegalStateException("wrong opaque type /DarkCloud/" + name);
                }
                if (spec.has("comment") && !spec.get("comment").getAsString().equals(
                        dataType.getDescription())) {
                    throw new IllegalStateException("opaque description mismatch for " + name);
                }
                continue;
            }
            if (dataType == null || dataType.getLength() != flexibleNumber(spec.get("size"))) {
                throw new IllegalStateException("missing/wrong type /DarkCloud/" + name);
            }
            if (kind.equals("enum")) {
                if (!(dataType instanceof ghidra.program.model.data.Enum)) {
                    throw new IllegalStateException("not an enum /DarkCloud/" + name);
                }
                ghidra.program.model.data.Enum actual =
                    (ghidra.program.model.data.Enum) dataType;
                if (actual.getCount() != spec.getAsJsonObject("values").size()) {
                    throw new IllegalStateException("enum member count mismatch for " + name);
                }
                for (Map.Entry<String, JsonElement> value :
                        spec.getAsJsonObject("values").entrySet()) {
                    if (actual.getValue(value.getKey()) != value.getValue().getAsLong()) {
                        throw new IllegalStateException("enum value mismatch for " + value.getKey());
                    }
                }
                continue;
            }
            if (!(dataType instanceof Structure)) {
                throw new IllegalStateException("not a structure /DarkCloud/" + name);
            }
            Structure actual = (Structure) dataType;
            if (actual.getNumDefinedComponents() != spec.getAsJsonArray("fields").size()) {
                throw new IllegalStateException("field count mismatch for " + name);
            }
            for (JsonElement fieldElement : spec.getAsJsonArray("fields")) {
                JsonObject field = fieldElement.getAsJsonObject();
                int offset = flexibleNumber(field.get("offset"));
                DataTypeComponent component = actual.getComponentAt(offset);
                if (component == null || !field.get("name").getAsString().equals(
                        component.getFieldName())) {
                    throw new IllegalStateException("field mismatch " + name + "+0x" +
                        Integer.toHexString(offset));
                }
                DataType expectedType = resolveType(field.get("type").getAsString());
                if (field.has("dimensions")) {
                    JsonArray dimensions = field.getAsJsonArray("dimensions");
                    for (int i = dimensions.size() - 1; i >= 0; i--) {
                        expectedType = new ArrayDataType(expectedType,
                            dimensions.get(i).getAsInt(), expectedType.getLength(), dtm);
                    }
                }
                if (!sameType(component.getDataType(), expectedType)) {
                    throw new IllegalStateException("field type mismatch " + name + "." +
                        component.getFieldName());
                }
                String expectedComment = field.has("comment")
                    ? field.get("comment").getAsString() : null;
                if (!Objects.equals(expectedComment, component.getComment())) {
                    throw new IllegalStateException("field comment mismatch " + name + "." +
                        component.getFieldName());
                }
            }
        }
    }

    private boolean sameType(DataType actual, DataType expected) {
        return actual.isEquivalent(expected) ||
            (actual.getLength() == expected.getLength() &&
             actual.getDisplayName().equals(expected.getDisplayName()));
    }

    private void verifySignature(Function function, JsonObject spec) throws Exception {
        if (function.getSignatureSource() != SourceType.USER_DEFINED) {
            throw new IllegalStateException("signature source mismatch for " + function.getName());
        }
        if (!sameType(function.getReturnType(),
                resolveType(spec.get("return_type").getAsString()))) {
            throw new IllegalStateException("return type mismatch for " + function.getName());
        }
        JsonArray expected = spec.getAsJsonArray("parameters");
        Parameter[] actual = function.getParameters();
        if (actual.length != expected.size()) {
            throw new IllegalStateException("parameter count mismatch for " + function.getName());
        }
        for (int i = 0; i < actual.length; i++) {
            JsonObject parameter = expected.get(i).getAsJsonObject();
            if (!actual[i].getName().equals(parameter.get("name").getAsString()) ||
                    !sameType(actual[i].getDataType(),
                        resolveType(parameter.get("type").getAsString()))) {
                throw new IllegalStateException("parameter mismatch " + i + " for " +
                    function.getName() + ": expected " + parameter.get("name").getAsString() +
                    " " + resolveType(parameter.get("type").getAsString()).getDisplayName() +
                    ", found " + actual[i].getName() + " " +
                    actual[i].getDataType().getDisplayName());
            }
        }
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
        verifyTypes(manifest.getAsJsonArray("types"));

        int verified = 0, skippedImages = 0, comments = 0, signatures = 0;
        FunctionManager manager = currentProgram.getFunctionManager();
        for (JsonElement element : manifest.getAsJsonArray("functions")) {
            monitor.checkCancelled();
            JsonObject spec = element.getAsJsonObject();
            if (!spec.get("image").getAsString().equals(currentImage)) {
                skippedImages++;
                continue;
            }
            Address start = toAddr(number(spec, "address"));
            int size = number(spec, "size");
            String name = spec.get("name").getAsString();
            if (!spec.get("sha256").getAsString().equals(sha256(start, size))) {
                throw new IllegalStateException("retail byte mismatch for " + name);
            }
            Function function = manager.getFunctionAt(start);
            if (function == null) throw new IllegalStateException("missing function " + name);
            AddressSetView body = function.getBody();
            if (body.getNumAddresses() != size || !body.getMinAddress().equals(start) ||
                    !body.getMaxAddress().equals(start.add(size - 1))) {
                throw new IllegalStateException("function boundary mismatch for " + name);
            }
            if (!function.getName().equals(name) ||
                    function.getSymbol().getSource() != SourceType.USER_DEFINED) {
                throw new IllegalStateException("name/source mismatch for " + name);
            }
            if (spec.has("comment")) {
                String actualComment = function.getComment();
                if (actualComment == null || !actualComment.contains(
                        spec.get("comment").getAsString())) {
                    throw new IllegalStateException("comment mismatch for " + name);
                }
                comments++;
            }
            if (spec.has("signature")) {
                verifySignature(function, spec.getAsJsonObject("signature"));
                signatures++;
            }
            verified++;
        }
        println(String.format(
            "VERIFIED functions=%d skipped_images=%d comments=%d signatures=%d types=%d",
            verified, skippedImages, comments, signatures,
            manifest.getAsJsonArray("types").size()));
    }
}
