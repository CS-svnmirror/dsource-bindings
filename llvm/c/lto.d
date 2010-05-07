//2.7
/*===-- llvm-c/lto.h - LTO Public C Interface ---------------------*- C -*-===*\
|*                                                                            *|
|*                     The LLVM Compiler Infrastructure                       *|
|*                                                                            *|
|* This file is distributed under the University of Illinois Open Source      *|
|* License. See LICENSE.TXT for details.                                      *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides public interface to an abstract link time optimization*|
|* library.  LLVM provides an implementation of this interface for use with   *|
|* llvm bitcode files.                                                        *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/
module llvm.c.lto;


const LTO_API_VERSION = 3;

enum lto_symbol_attributes {
    ALIGNMENT_MASK         = 0x0000001F,    /* log2 of alignment */
    PERMISSIONS_MASK       = 0x000000E0,    
    PERMISSIONS_CODE       = 0x000000A0,    
    PERMISSIONS_DATA       = 0x000000C0,    
    PERMISSIONS_RODATA     = 0x00000080,    
    DEFINITION_MASK        = 0x00000700,    
    DEFINITION_REGULAR     = 0x00000100,    
    DEFINITION_TENTATIVE   = 0x00000200,    
    DEFINITION_WEAK        = 0x00000300,    
    DEFINITION_UNDEFINED   = 0x00000400,    
    DEFINITION_WEAKUNDEF   = 0x00000500,
    SCOPE_MASK             = 0x00003800,    
    SCOPE_INTERNAL         = 0x00000800,    
    SCOPE_HIDDEN           = 0x00001000,    
    SCOPE_PROTECTED        = 0x00002000,    
    SCOPE_DEFAULT          = 0x00001800    
}

enum lto_debug_model {
    MODEL_NONE         = 0,
    MODEL_DWARF        = 1
}

enum lto_codegen_model{
    STATIC         = 0,
    DYNAMIC        = 1,
    DYNAMIC_NO_PIC = 2
}


/** opaque reference to a loaded object module */
typedef /*struct LTOModule*/ void*         lto_module_t;

/** opaque reference to a code generator */
typedef /*struct LTOCodeGenerator*/ void*  lto_code_gen_t;

extern(C):

/**
 * Returns a printable string.
 */
extern /*const*/ char*
lto_get_version();


/**
 * Returns the last error string or NULL if last operation was sucessful.
 */
extern /*const*/ char*
lto_get_error_message();

/**
 * Checks if a file is a loadable object file.
 */
extern bool
lto_module_is_object_file(/*const*/ char* path);


/**
 * Checks if a file is a loadable object compiled for requested target.
 */
extern bool
lto_module_is_object_file_for_target(/*const*/ char* path, 
                                     /*const*/ char* target_triple_prefix);


/**
 * Checks if a buffer is a loadable object file.
 */
extern bool
lto_module_is_object_file_in_memory(/*const*/ void* mem, size_t length);


/**
 * Checks if a buffer is a loadable object compiled for requested target.
 */
extern bool
lto_module_is_object_file_in_memory_for_target(/*const*/ void* mem, size_t length, /*const*/ char* target_triple_prefix);


/**
 * Loads an object file from disk.
 * Returns NULL on error (check lto_get_error_message() for details).
 */
extern lto_module_t
lto_module_create(/*const*/ char* path);


/**
 * Loads an object file from memory.
 * Returns NULL on error (check lto_get_error_message() for details).
 */
extern lto_module_t
lto_module_create_from_memory(/*const*/ void* mem, size_t length);


/**
 * Frees all memory internally allocated by the module.
 * Upon return the lto_module_t is no longer valid.
 */
extern void
lto_module_dispose(lto_module_t mod);


/**
 * Returns triple string which the object module was compiled under.
 */
extern /*const*/ char*
lto_module_get_target_triple(lto_module_t mod);


/**
 * Returns the number of symbols in the object module.
 */
extern uint
lto_module_get_num_symbols(lto_module_t mod);


/**
 * Returns the name of the ith symbol in the object module.
 */
extern /*const*/ char*
lto_module_get_symbol_name(lto_module_t mod, uint index);


/**
 * Returns the attributes of the ith symbol in the object module.
 */
extern lto_symbol_attributes
lto_module_get_symbol_attribute(lto_module_t mod, uint index);


/**
 * Instantiates a code generator.
 * Returns NULL on error (check lto_get_error_message() for details).
 */
extern lto_code_gen_t
lto_codegen_create();


/**
 * Frees all code generator and all memory it internally allocated.
 * Upon return the lto_code_gen_t is no longer valid.
 */
extern void
lto_codegen_dispose(lto_code_gen_t);



/**
 * Add an object module to the set of modules for which code will be generated.
 * Returns true on error (check lto_get_error_message() for details).
 */
extern bool
lto_codegen_add_module(lto_code_gen_t cg, lto_module_t mod);



/**
 * Sets if debug info should be generated.
 * Returns true on error (check lto_get_error_message() for details).
 */
extern bool
lto_codegen_set_debug_model(lto_code_gen_t cg, lto_debug_model);


/**
 * Sets which PIC code model to generated.
 * Returns true on error (check lto_get_error_message() for details).
 */
extern bool
lto_codegen_set_pic_model(lto_code_gen_t cg, lto_codegen_model);


/**
 * Sets the location of the "gcc" to run. If not set, libLTO will search for
 * "gcc" on the path.
 */
extern void
lto_codegen_set_gcc_path(lto_code_gen_t cg, /*const*/ char* path);


/**
 * Sets the location of the assembler tool to run. If not set, libLTO
 * will use gcc to invoke the assembler.
 */
extern void
lto_codegen_set_assembler_path(lto_code_gen_t cg, /*const*/ char* path);


/**
 * Adds to a list of all global symbols that must exist in the final
 * generated code.  If a function is not listed, it might be
 * inlined into every usage and optimized away.
 */
extern void
lto_codegen_add_must_preserve_symbol(lto_code_gen_t cg, /*const*/ char* symbol);


/**
 * Writes a new object file at the specified path that contains the
 * merged contents of all modules added so far.
 * Returns true on error (check lto_get_error_message() for details).
 */
extern bool
lto_codegen_write_merged_modules(lto_code_gen_t cg, /*const*/ char* path);


/**
 * Generates code for all added modules into one native object file.
 * On sucess returns a pointer to a generated mach-o/ELF buffer and
 * length set to the buffer size.  The buffer is owned by the 
 * lto_code_gen_t and will be freed when lto_codegen_dispose()
 * is called, or lto_codegen_compile() is called again.
 * On failure, returns NULL (check lto_get_error_message() for details).
 */
extern /*const*/ void*
lto_codegen_compile(lto_code_gen_t cg, size_t* length);


/**
 * Sets options to help debug codegen bugs.
 */
extern void
lto_codegen_debug_options(lto_code_gen_t cg, /*const*/ char *);

