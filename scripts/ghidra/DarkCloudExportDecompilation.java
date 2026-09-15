// Export manifest functions through Ghidra's decompiler, grouped by translation unit.
//@category Dark Cloud

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.*;

import com.google.gson.*;

import ghidra.app.decompiler.*;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;

public class DarkCloudExportDecompilation extends GhidraScript {
    private static int number(JsonObject object, String key) {
        return (int) Long.decode(object.get(key).getAsString()).longValue();
    }

    private BufferedWriter writerFor(Map<String, BufferedWriter> writers, Path outputRoot,
            String translationUnit) throws Exception {
        BufferedWriter existing = writers.get(translationUnit);
        if (existing != null) return existing;
        if (!translationUnit.matches("[A-Za-z0-9_./-]+") ||
                translationUnit.contains("..")) {
            throw new IllegalArgumentException("unsafe translation unit path " + translationUnit);
        }
        Path path = outputRoot.resolve(translationUnit).resolve(
            "ghidra-decompilation.md").normalize();
        if (!path.startsWith(outputRoot.normalize())) {
            throw new IllegalArgumentException("translation unit escapes output root");
        }
        Files.createDirectories(path.getParent());
        BufferedWriter writer = Files.newBufferedWriter(path, StandardCharsets.UTF_8,
            StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING,
            StandardOpenOption.WRITE);
        writer.write("# Ghidra decompilation: `" + translationUnit + "`\n\n");
        writer.write("Generated from the byte-verified retail function manifest. ");
        writer.write("Decompiler failures and timeouts are retained explicitly.\n\n");
        writers.put(translationUnit, writer);
        return writer;
    }

    private void writeResult(BufferedWriter writer, JsonObject spec, String status,
            String detail, String decompilation) throws Exception {
        writer.write("## `" + spec.get("name").getAsString() + "`\n\n");
        writer.write("- Address: `" + spec.get("address").getAsString() + "`\n");
        writer.write("- Size: `" + spec.get("size").getAsString() + "`\n");
        writer.write("- Status: `" + status + "`\n");
        if (detail != null && !detail.isBlank()) {
            writer.write("- Detail: " + detail.replace("\n", " ") + "\n");
        }
        writer.write("\n");
        if (decompilation != null) {
            writer.write("```c\n");
            writer.write(decompilation);
            if (!decompilation.endsWith("\n")) writer.write("\n");
            writer.write("```\n\n");
        }
    }

    @Override
    public void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length < 2 || args.length > 3) {
            throw new IllegalArgumentException(
                "expected annotation JSON, output root, and optional timeout seconds");
        }
        int timeout = args.length == 3 ? Integer.parseInt(args[2]) : 120;
        if (timeout < 1) throw new IllegalArgumentException("timeout must be positive");
        JsonObject manifest;
        try (Reader reader = new BufferedReader(new FileReader(args[0]))) {
            manifest = JsonParser.parseReader(reader).getAsJsonObject();
        }
        String currentImage = null;
        for (Map.Entry<String, JsonElement> program :
                manifest.getAsJsonObject("programs").entrySet()) {
            if (currentProgram.getName().equals(program.getValue().getAsString())) {
                currentImage = program.getKey();
                break;
            }
        }
        if (currentImage == null) throw new IllegalArgumentException("manifest/program mismatch");

        Path outputRoot = Paths.get(args[1]).toAbsolutePath().normalize();
        Map<String, BufferedWriter> writers = new LinkedHashMap<>();
        DecompInterface decompiler = new DecompInterface();
        decompiler.toggleCCode(true);
        decompiler.toggleSyntaxTree(true);
        if (!decompiler.openProgram(currentProgram)) {
            throw new IllegalStateException("cannot open program in decompiler");
        }
        int completed = 0, failed = 0, timedOut = 0, missing = 0;
        try {
            for (JsonElement element : manifest.getAsJsonArray("functions")) {
                monitor.checkCancelled();
                JsonObject spec = element.getAsJsonObject();
                if (!spec.get("image").getAsString().equals(currentImage)) continue;
                String unit = spec.get("translation_unit").getAsString();
                BufferedWriter writer = writerFor(writers, outputRoot, unit);
                Address address = toAddr(number(spec, "address"));
                Function function = getFunctionAt(address);
                if (function == null) {
                    writeResult(writer, spec, "missing-function", null, null);
                    writer.flush();
                    missing++;
                    continue;
                }
                try {
                    DecompileResults result = decompiler.decompileFunction(
                        function, timeout, monitor);
                    if (result.decompileCompleted() && result.getDecompiledFunction() != null) {
                        writeResult(writer, spec, "completed", null,
                            result.getDecompiledFunction().getC());
                        completed++;
                    }
                    else {
                        String message = result.getErrorMessage();
                        boolean timeoutFailure = message != null &&
                            message.toLowerCase(Locale.ROOT).contains("timeout");
                        writeResult(writer, spec, timeoutFailure ? "timeout" : "failed",
                            message, null);
                        if (timeoutFailure) timedOut++; else failed++;
                    }
                }
                catch (Exception error) {
                    writeResult(writer, spec, "exception", error.toString(), null);
                    failed++;
                }
                writer.flush();
            }
        }
        finally {
            decompiler.dispose();
            for (BufferedWriter writer : writers.values()) writer.close();
        }
        println(String.format(
            "EXPORTED image=%s completed=%d failed=%d timed_out=%d missing=%d units=%d",
            currentImage, completed, failed, timedOut, missing, writers.size()));
    }
}
