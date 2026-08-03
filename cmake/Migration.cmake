# Carving of the reference data-section dumps, driven by the migration
# manifest. Trees that predate the manifest simply have no generated sections
# and link the checked-in .lcf as-is.

set(MIGRATE_MANIFEST asm/migrated_symbols.txt)
set(MIGRATE_SCRIPT scripts/build/migrate_section.py)

# The reference dumps are read at configure time, so a tree that has not been
# set up yet configures with migration off. Nothing links until the dumps
# exist anyway, since the object lists are sourced from them.
function(migration_enabled out_var)
    if(EXISTS ${CMAKE_SOURCE_DIR}/${MIGRATE_MANIFEST}
       AND EXISTS ${CMAKE_SOURCE_DIR}/${MIGRATE_SCRIPT}
       AND IS_DIRECTORY ${CMAKE_SOURCE_DIR}/${REF_DIR}/asm/sections)
        set(${out_var} TRUE PARENT_SCOPE)
    else()
        set(${out_var} FALSE PARENT_SCOPE)
    endif()
endfunction()

# Run migrate_section.py at configure time and return its output as a list.
function(migrate_query out_var)
    execute_process(
        COMMAND ${PYTHON} ${MIGRATE_SCRIPT} ${ARGN}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE out
        RESULT_VARIABLE rc
        OUTPUT_STRIP_TRAILING_WHITESPACE)
    if(NOT rc EQUAL 0)
        message(FATAL_ERROR "migrate_section.py ${ARGN} failed: ${rc}")
    endif()
    string(REGEX REPLACE "[ \t\r\n]+" ";" out "${out}")
    set(${out_var} "${out}" PARENT_SCOPE)
endfunction()

# The section dumps the manifest carves, e.g. "main.data". Empty before setup
# has run, which is when nothing is carved anyway.
function(migrated_section_names out_var)
    migration_enabled(enabled)
    set(names "")
    if(enabled)
        migrate_query(names --list-sections ${MIGRATE_MANIFEST})
    endif()
    set(${out_var} "${names}" PARENT_SCOPE)
endfunction()

# Declare one rule per migrated section. Each emits all of that section's split
# parts plus its plan JSON in a single pass.
function(add_migrated_sections out_s_files out_plans)
    set(s_files "")
    set(plans "")
    migration_enabled(enabled)

    # Configuring before setup has run is the normal bootstrap, not a problem:
    # every entry point configures, builds `setup`, then configures again so
    # this pass sees the dumps. Saying so at STATUS keeps that path quiet.
    # A ref/ that exists but has no sections/ is the case actually worth a
    # warning -- setup ran and did not produce them.
    if(NOT enabled AND EXISTS ${CMAKE_SOURCE_DIR}/${MIGRATE_MANIFEST})
        if(EXISTS ${CMAKE_SOURCE_DIR}/${REF_DIR})
            message(WARNING
                "No reference dumps under ${REF_DIR}/asm/sections, though "
                "${REF_DIR} exists. Data migration is off for this build; "
                "re-run the setup target.")
        else()
            message(STATUS
                "No ${REF_DIR} yet: configuring with data migration off. "
                "The setup target and the reconfigure after it enable it.")
        endif()
    endif()

    if(enabled)
        set(manifest ${CMAKE_SOURCE_DIR}/${MIGRATE_MANIFEST})
        set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS ${manifest})

        migrate_query(sections --list-sections ${MIGRATE_MANIFEST})
        foreach(sec IN LISTS sections)
            string(REGEX MATCH "^[^.]+" file ${sec})
            set(ref ${REF_DIR}/asm/sections/${file}/${sec}.s)
            set(outdir ${BUILD_DIR}/generated/${file})

            if(NOT EXISTS ${CMAKE_SOURCE_DIR}/${ref})
                message(FATAL_ERROR
                    "Missing reference dump ${ref}. Run the setup target first.")
            endif()
            migrate_query(parts --list-parts
                ${ref} ${MIGRATE_MANIFEST} ${sec} ${outdir})

            set(outputs "")
            foreach(part IN LISTS parts)
                list(APPEND outputs ${CMAKE_SOURCE_DIR}/${part})
            endforeach()
            list(APPEND outputs ${CMAKE_SOURCE_DIR}/${outdir}/${sec}.plan.json)

            add_custom_command(
                OUTPUT ${outputs}
                COMMAND ${CMAKE_COMMAND} -E make_directory ${outdir}
                COMMAND ${PYTHON_CMD} ${MIGRATE_SCRIPT} --emit
                        ${ref} ${MIGRATE_MANIFEST} ${sec} ${outdir}
                DEPENDS ${CMAKE_SOURCE_DIR}/${ref} ${manifest}
                        ${CMAKE_SOURCE_DIR}/${MIGRATE_SCRIPT}
                WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
                COMMENT "Carving ${sec}"
                VERBATIM)

            list(APPEND s_files ${parts})
            list(APPEND plans ${CMAKE_SOURCE_DIR}/${outdir}/${sec}.plan.json)
        endforeach()
    endif()

    set(${out_s_files} "${s_files}" PARENT_SCOPE)
    set(${out_plans} "${plans}" PARENT_SCOPE)
endfunction()

# The objects gen_lcf.py must objdump to compute island padding.
function(migrated_contrib_objs out_var objdir)
    set(objs "")
    migration_enabled(enabled)

    if(enabled)
        migrate_query(names --list-contrib-objs ${MIGRATE_MANIFEST})
        foreach(name IN LISTS names)
            list(APPEND objs ${CMAKE_SOURCE_DIR}/${objdir}/${name})
        endforeach()
    endif()

    set(${out_var} "${objs}" PARENT_SCOPE)
endfunction()
