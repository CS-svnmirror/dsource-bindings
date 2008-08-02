module lua.lauxlib;

private import lua.lua;
private import lua.luaconf;

extern (C):

int luaL_getn(lua_State* L, int i) { return lua_objlen(L, i); }
void luaL_setn(lua_State* L, int i, int j) { }

alias luaL_openlib luaI_openlib;

struct luaL_Reg
{
    char *name;
    lua_CFunction func;
}

void  luaL_openlib(lua_State *L, char *libname, luaL_Reg *l, int nup);
void  luaL_register(lua_State *L, char *libname, luaL_Reg *l);
int  luaL_getmetafield(lua_State *L, int obj, char *e);
int  luaL_callmeta(lua_State *L, int obj, char *e);
int  luaL_typerror(lua_State *L, int narg, char *tname);
int  luaL_argerror(lua_State *L, int numarg, char *extramsg);
char * luaL_checklstring(lua_State *L, int numArg, size_t *l);
char * luaL_optlstring(lua_State *L, int numArg, char *def, size_t *l);
lua_Number  luaL_checknumber(lua_State *L, int numArg);
lua_Number  luaL_optnumber(lua_State *L, int nArg, lua_Number def);

lua_Integer  luaL_checkinteger(lua_State *L, int numArg);
lua_Integer  luaL_optinteger(lua_State *L, int nArg, lua_Integer def);

void  luaL_checkstack(lua_State *L, int sz, char *msg);
void  luaL_checktype(lua_State *L, int narg, int t);
void  luaL_checkany(lua_State *L, int narg);

int  luaL_newmetatable(lua_State *L, char *tname);
void * luaL_checkudata(lua_State *L, int ud, char *tname);

void  luaL_where(lua_State *L, int lvl);
int  luaL_error(lua_State *L, char *fmt,...);

int  luaL_checkoption(lua_State *L, int narg, char *def, char **lst);

int  luaL_ref(lua_State *L, int t);
void  luaL_unref(lua_State *L, int t, int _ref);

int  luaL_loadfile(lua_State *L, char *filename);
int  luaL_loadbuffer(lua_State *L, char *buff, size_t sz, char *name);
int  luaL_loadstring(lua_State *L, char *s);

lua_State * luaL_newstate();

char * luaL_gsub(lua_State *L, char *s, char *p, char *r);

char * luaL_findtable(lua_State *L, int idx, char *fname, int szhint);

// some useful macros

void luaL_argcheck(lua_State* L, int cond, int numarg, char* extramsg) { if (!cond) luaL_argerror(L, numarg, extramsg); }
char* luaL_checkstring(lua_State* L, int n) { return luaL_checklstring(L, n, null); }
char* luaL_optstring(lua_State* L, int n, char* d) { return luaL_optlstring(L, n, d, null); }
int luaL_checkint(lua_State* L, int n) { return luaL_checkinteger(L, n); }
int luaL_optint (lua_State* L, int n, int d) { return luaL_optinteger(L, n, d); }
long luaL_checklong(lua_State* L, int n) { return luaL_checkinteger(L, n); }
int luaL_optlong(lua_State* L, int n, int d) { return luaL_optinteger(L, n, d); }

char* luaL_typename(lua_State* L, int i) { return lua_typename(L, lua_type(L, i)); }

int luaL_dofile(lua_State* L, char* fn) { return luaL_loadfile(L, fn) || lua_pcall(L, 0, LUA_MULTRET, 0); }

int luaL_dostring(lua_State*L, char* s) { return luaL_loadstring(L, s) || lua_pcall(L, 0, LUA_MULTRET, 0); }

void luaL_getmetatable(lua_State* L, char* s) { lua_getfield(L, LUA_REGISTRYINDEX, s); }

bool luaL_opt(lua_State* L, int function(lua_State*, int) f, int n, int d) { return luaL_opt(L, f, n, d); }

// Generic Buffer manipulation
struct luaL_Buffer
{
    char *p;
    int lvl;
    lua_State *L;
    char [LUAL_BUFFERSIZE]buffer;
}

void luaL_addchar(luaL_Buffer* B, char c)
{
	if (B.p < B.buffer.ptr + LUAL_BUFFERSIZE || (luaL_prepbuffer(B)))
	{
		*B.p = c;
		B.p++;
	}
}

void luaL_putchar(luaL_Buffer* B, char c) { luaL_addchar(B, c); }

void luaL_addsize(luaL_Buffer* B, int n) { B.p += n; }

void  luaL_buffinit(lua_State *L, luaL_Buffer *B);
char * luaL_prepbuffer(luaL_Buffer *B);
void  luaL_addlstring(luaL_Buffer *B, char *s, size_t l);
void  luaL_addstring(luaL_Buffer *B, char *s);
void  luaL_addvalue(luaL_Buffer *B);
void  luaL_pushresult(luaL_Buffer *B);


// compatibility with ref system

const LUA_NOREF = -2;
const LUA_REFNIL = -1;

void lua_ref(lua_State* L, int lock) { lock ? luaL_ref(L, LUA_REGISTRYINDEX) : lua_pushstring(L, "unlocked reference are obsolete"); lua_error(L); }
void lua_unref(lua_State* L, int _ref) { luaL_unref(L, LUA_REGISTRYINDEX, _ref); }
void lua_getref(lua_State* L, int _ref) { lua_rawgeti(L, LUA_REGISTRYINDEX, _ref); }

alias luaL_Reg luaL_reg;

// some additional aliases
alias luaL_checkstring     luaL_check_string;   
alias luaL_optstring       luaL_opt_string;  
alias luaL_checkint        luaL_check_int;   
alias luaL_checkint       luaL_check_int; 
alias luaL_checklong       luaL_check_long;
alias luaL_optint          luaL_opt_int;  
alias luaL_optint         luaL_opt_int;   
alias luaL_optlong         luaL_opt_long;
