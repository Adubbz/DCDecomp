// Report the persistent analysis state of the Dark Cloud retail executable.
//@category Dark Cloud

import java.util.*;

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.AddressIterator;
import ghidra.program.model.data.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.mem.MemoryBlock;
import ghidra.program.model.symbol.*;

public class DarkCloudInventory extends GhidraScript {
    @Override
    public void run() throws Exception {
        println("program=" + currentProgram.getName());
        println("language=" + currentProgram.getLanguageID());
        println("compiler=" + currentProgram.getCompilerSpec().getCompilerSpecID());
        println("image_base=" + currentProgram.getImageBase());
        println("executable_format=" + currentProgram.getExecutableFormat());
        println("executable_path=" + currentProgram.getExecutablePath());

        int functions = 0;
        int namedFunctions = 0;
        int defaultFunctions = 0;
        EnumMap<SourceType, Integer> functionSources = new EnumMap<>(SourceType.class);
        EnumMap<SourceType, Integer> signatureSources = new EnumMap<>(SourceType.class);
        FunctionIterator fit = currentProgram.getFunctionManager().getFunctions(true);
        while (fit.hasNext()) {
            Function function = fit.next();
            functions++;
            SourceType source = function.getSymbol().getSource();
            functionSources.put(source, functionSources.getOrDefault(source, 0) + 1);
            SourceType signatureSource = function.getSignatureSource();
            signatureSources.put(signatureSource,
                signatureSources.getOrDefault(signatureSource, 0) + 1);
            if (source == SourceType.DEFAULT) defaultFunctions++;
            else namedFunctions++;
        }
        println("functions=" + functions);
        println("named_functions=" + namedFunctions);
        println("default_functions=" + defaultFunctions);
        println("function_name_sources=" + functionSources);
        println("function_signature_sources=" + signatureSources);

        int symbols = 0;
        EnumMap<SourceType, Integer> symbolSources = new EnumMap<>(SourceType.class);
        SymbolIterator sit = currentProgram.getSymbolTable().getAllSymbols(true);
        while (sit.hasNext()) {
            Symbol symbol = sit.next();
            symbols++;
            SourceType source = symbol.getSource();
            symbolSources.put(source, symbolSources.getOrDefault(source, 0) + 1);
        }
        println("symbols=" + symbols);
        println("symbol_sources=" + symbolSources);

        DataTypeManager dtm = currentProgram.getDataTypeManager();
        int dataTypes = 0;
        int structures = 0;
        int unions = 0;
        int enums = 0;
        Map<String, Integer> dataTypeCategories = new TreeMap<>();
        Iterator<DataType> dit = dtm.getAllDataTypes();
        while (dit.hasNext()) {
            DataType dataType = dit.next();
            dataTypes++;
            String category = dataType.getCategoryPath().getPath();
            dataTypeCategories.put(category, dataTypeCategories.getOrDefault(category, 0) + 1);
            if (dataType instanceof Structure) structures++;
            else if (dataType instanceof Union) unions++;
            else if (dataType instanceof ghidra.program.model.data.Enum) enums++;
        }
        println("data_types=" + dataTypes);
        println("structures=" + structures);
        println("unions=" + unions);
        println("enums=" + enums);
        println("data_type_categories=" + dataTypeCategories);

        int plateComments = 0;
        int preComments = 0;
        int postComments = 0;
        int eolComments = 0;
        Listing listing = currentProgram.getListing();
        for (AddressIterator it = listing.getCommentAddressIterator(
                CodeUnit.PLATE_COMMENT, currentProgram.getMemory(), true); it.hasNext();) {
            it.next(); plateComments++;
        }
        for (AddressIterator it = listing.getCommentAddressIterator(
                CodeUnit.PRE_COMMENT, currentProgram.getMemory(), true); it.hasNext();) {
            it.next(); preComments++;
        }
        for (AddressIterator it = listing.getCommentAddressIterator(
                CodeUnit.POST_COMMENT, currentProgram.getMemory(), true); it.hasNext();) {
            it.next(); postComments++;
        }
        for (AddressIterator it = listing.getCommentAddressIterator(
                CodeUnit.EOL_COMMENT, currentProgram.getMemory(), true); it.hasNext();) {
            it.next(); eolComments++;
        }
        println(String.format("comments=plate:%d,pre:%d,post:%d,eol:%d",
            plateComments, preComments, postComments, eolComments));

        println("memory_blocks:");
        for (MemoryBlock block : currentProgram.getMemory().getBlocks()) {
            println(String.format("  %s %s-%s size=0x%x %s%s%s",
                block.getName(), block.getStart(), block.getEnd(), block.getSize(),
                block.isRead() ? "r" : "-", block.isWrite() ? "w" : "-",
                block.isExecute() ? "x" : "-"));
        }
    }
}
