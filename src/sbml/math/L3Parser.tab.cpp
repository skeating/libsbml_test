/* A Bison parser, made by GNU Bison 2.4.2.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2006, 2009-2010 Free Software
   Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.4.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0

/* Substitute the variable and function names.  */
#define yyparse         sbml_yyparse
#define yylex           sbml_yylex
#define yyerror         sbml_yyerror
#define yylval          sbml_yylval
#define yychar          sbml_yychar
#define yydebug         sbml_yydebug
#define yynerrs         sbml_yynerrs


/* Copy the first part of user declarations.  */

/* Line 189 of yacc.c  */
#line 53 "L3Parser.ypp"

  //#define YYSTYPE double
#include "L3Parser.h"
  using namespace std;

  int sbml_yylex(void);
  L3Parser* l3p = NULL;
  void sbml_yyerror(char const *);
  int sbml_yylloc_first_position = 1;
  int sbml_yylloc_last_position = 1;


/* Line 189 of yacc.c  */
#line 93 "L3Parser.tab.cpp"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 1
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     YYEOF = 0,
     NOT = 258,
     NEG = 259,
     DOUBLE = 260,
     INTEGER = 261,
     E_NOTATION = 262,
     RATIONAL = 263,
     SYMBOL = 264
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 214 of yacc.c  */
#line 66 "L3Parser.ypp"

  ASTNode* astnode;
  char character;
  const string* word;
  double numdouble;
  long   numlong;
  double mantissa;
  long   rational;



/* Line 214 of yacc.c  */
#line 151 "L3Parser.tab.cpp"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 264 of yacc.c  */
#line 163 "L3Parser.tab.cpp"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  17
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   170

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  25
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  5
/* YYNRULES -- Number of rules.  */
#define YYNRULES  35
/* YYNRULES -- Number of states.  */
#define YYNSTATES  63

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   264

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     8,     2,     2,     2,    14,     3,     2,
      22,    23,    12,    11,    24,    10,     2,    13,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       5,     7,     6,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    15,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     4,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     9,    16,
      17,    18,    19,    20,    21
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint8 yyprhs[] =
{
       0,     0,     3,     4,     6,     8,    11,    13,    15,    19,
      23,    27,    31,    35,    39,    43,    47,    51,    54,    59,
      64,    69,    74,    79,    84,    89,    94,    97,   101,   106,
     108,   110,   112,   114,   117,   119
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      26,     0,    -1,    -1,    27,    -1,     1,    -1,    27,     1,
      -1,    28,    -1,    21,    -1,    22,    27,    23,    -1,    27,
      15,    27,    -1,    27,    12,    27,    -1,    27,    11,    27,
      -1,    27,    13,    27,    -1,    27,    10,    27,    -1,    27,
      14,    27,    -1,    27,     6,    27,    -1,    27,     5,    27,
      -1,    10,    27,    -1,    27,     6,     7,    27,    -1,    27,
       5,     7,    27,    -1,    27,     7,     7,    27,    -1,    27,
       8,     7,    27,    -1,    27,     5,     6,    27,    -1,    27,
       6,     5,    27,    -1,    27,     3,     3,    27,    -1,    27,
       4,     4,    27,    -1,     8,    27,    -1,    21,    22,    23,
      -1,    21,    22,    29,    23,    -1,    17,    -1,    19,    -1,
      18,    -1,    20,    -1,    28,    21,    -1,    27,    -1,    29,
      24,    27,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    99,    99,   100,   101,   102,   105,   106,   132,   133,
     134,   145,   156,   157,   158,   159,   160,   161,   194,   195,
     196,   197,   198,   199,   200,   201,   202,   203,   214,   265,
     266,   267,   268,   269,   283,   284
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of string\"", "error", "$undefined", "'&'", "'|'", "'<'", "'>'",
  "'='", "'!'", "NOT", "'-'", "'+'", "'*'", "'/'", "'%'", "'^'", "NEG",
  "\"number\"", "\"integer\"", "\"number in e-notation form\"",
  "\"number in rational notation\"", "\"element name\"", "'('", "')'",
  "','", "$accept", "input", "node", "number", "nodelist", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,    38,   124,    60,    62,    61,    33,   258,
      45,    43,    42,    47,    37,    94,   259,   260,   261,   262,
     263,   264,    40,    41,    44
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    25,    26,    26,    26,    26,    27,    27,    27,    27,
      27,    27,    27,    27,    27,    27,    27,    27,    27,    27,
      27,    27,    27,    27,    27,    27,    27,    27,    27,    28,
      28,    28,    28,    28,    29,    29
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     0,     1,     1,     2,     1,     1,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     2,     4,     4,
       4,     4,     4,     4,     4,     4,     2,     3,     4,     1,
       1,     1,     1,     2,     1,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     4,     0,     0,    29,    31,    30,    32,     7,     0,
       0,     0,     6,    26,    17,     0,     0,     1,     5,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    33,    27,    34,     0,     8,     0,     0,     0,     0,
      16,     0,     0,    15,     0,     0,    13,    11,    10,    12,
      14,     9,    28,     0,    24,    25,    22,    19,    23,    18,
      20,    21,    35
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,    10,    11,    12,    34
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -17
static const yytype_int16 yypact[] =
{
      44,   -17,    38,    38,   -17,   -17,   -17,   -17,   -16,    38,
      10,   115,    -9,    93,   -17,   123,    64,   -17,   -17,     8,
      11,    92,    75,     7,     9,    38,    38,    38,    38,    38,
      38,   -17,   -17,   144,   -15,   -17,    38,    38,    38,    38,
      93,    38,    38,    93,    38,    38,   -10,   -10,     2,     2,
       2,     2,   -17,    38,   155,   155,    93,    93,    93,    93,
      93,    93,   144
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -17,   -17,    -2,   -17,   -17
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -4
static const yytype_int8 yytable[] =
{
      13,    14,    27,    28,    29,    30,    15,    16,    52,    53,
      17,    36,    31,    33,    44,    37,    45,    30,     0,    40,
      43,     0,     0,    46,    47,    48,    49,    50,    51,     0,
       0,     0,     0,     0,    54,    55,    56,    57,     0,    58,
      59,     0,    60,    61,    -2,     1,     2,     0,     3,     0,
       0,    62,     2,     0,     3,     4,     5,     6,     7,     8,
       9,     4,     5,     6,     7,     8,     9,    19,    20,    21,
      22,    23,    24,     0,    25,    26,    27,    28,    29,    30,
      41,     0,    42,     2,     0,     3,     0,    35,     0,     0,
       0,     0,     4,     5,     6,     7,     8,     9,    38,    39,
       2,     0,     3,    25,    26,    27,    28,    29,    30,     4,
       5,     6,     7,     8,     9,    -3,    18,     0,    19,    20,
      21,    22,    23,    24,     0,    25,    26,    27,    28,    29,
      30,     2,     0,     3,     0,     0,     0,     0,     0,     0,
       4,     5,     6,     7,     8,     9,    32,    19,    20,    21,
      22,    23,    24,     0,    25,    26,    27,    28,    29,    30,
      21,    22,    23,    24,     0,    25,    26,    27,    28,    29,
      30
};

static const yytype_int8 yycheck[] =
{
       2,     3,    12,    13,    14,    15,    22,     9,    23,    24,
       0,     3,    21,    15,     7,     4,     7,    15,    -1,    21,
      22,    -1,    -1,    25,    26,    27,    28,    29,    30,    -1,
      -1,    -1,    -1,    -1,    36,    37,    38,    39,    -1,    41,
      42,    -1,    44,    45,     0,     1,     8,    -1,    10,    -1,
      -1,    53,     8,    -1,    10,    17,    18,    19,    20,    21,
      22,    17,    18,    19,    20,    21,    22,     3,     4,     5,
       6,     7,     8,    -1,    10,    11,    12,    13,    14,    15,
       5,    -1,     7,     8,    -1,    10,    -1,    23,    -1,    -1,
      -1,    -1,    17,    18,    19,    20,    21,    22,     6,     7,
       8,    -1,    10,    10,    11,    12,    13,    14,    15,    17,
      18,    19,    20,    21,    22,     0,     1,    -1,     3,     4,
       5,     6,     7,     8,    -1,    10,    11,    12,    13,    14,
      15,     8,    -1,    10,    -1,    -1,    -1,    -1,    -1,    -1,
      17,    18,    19,    20,    21,    22,    23,     3,     4,     5,
       6,     7,     8,    -1,    10,    11,    12,    13,    14,    15,
       5,     6,     7,     8,    -1,    10,    11,    12,    13,    14,
      15
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     8,    10,    17,    18,    19,    20,    21,    22,
      26,    27,    28,    27,    27,    22,    27,     0,     1,     3,
       4,     5,     6,     7,     8,    10,    11,    12,    13,    14,
      15,    21,    23,    27,    29,    23,     3,     4,     6,     7,
      27,     5,     7,    27,     7,     7,    27,    27,    27,    27,
      27,    27,    23,    24,    27,    27,    27,    27,    27,    27,
      27,    27,    27
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}

/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*-------------------------.
| yyparse or yypush_parse.  |
`-------------------------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{


    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 3:

/* Line 1464 of yacc.c  */
#line 100 "L3Parser.ypp"
    {l3p->outputNode = (yyvsp[(1) - (1)].astnode);}
    break;

  case 4:

/* Line 1464 of yacc.c  */
#line 101 "L3Parser.ypp"
    {;}
    break;

  case 5:

/* Line 1464 of yacc.c  */
#line 102 "L3Parser.ypp"
    {delete (yyvsp[(1) - (2)].astnode);;}
    break;

  case 6:

/* Line 1464 of yacc.c  */
#line 105 "L3Parser.ypp"
    {(yyval.astnode) = (yyvsp[(1) - (1)].astnode);;}
    break;

  case 7:

/* Line 1464 of yacc.c  */
#line 106 "L3Parser.ypp"
    {
                   (yyval.astnode) = new ASTNode();
                   string name(*(yyvsp[(1) - (1)].word));
                   (yyval.astnode)->setName(name.c_str());
                   if (l3p->model == NULL ||
                       (l3p->model->getSpecies(name) == NULL
                        && l3p->model->getCompartment(name) == NULL
                        && l3p->model->getReaction(name) == NULL
                        && l3p->model->getParameter(name) == NULL
                        && l3p->model->getSpeciesReference(name) == NULL)) {
                     //The symbol is not used in any other mathematical context in the SBML model, so we can see if it matches a list of pre-defined names
                     ASTNodeType_t type = l3p->getSymbolFor(name);
                     if (type != AST_UNKNOWN) (yyval.astnode)->setType(type);
                     if (type==AST_REAL) {
                       if (l3p->caselessStrCmp(name, "inf"))          (yyval.astnode)->setValue(numeric_limits<double>::infinity());
                       if (l3p->caselessStrCmp(name, "infinity"))     (yyval.astnode)->setValue(numeric_limits<double>::infinity());
                       if (l3p->caselessStrCmp(name, "nan"))          (yyval.astnode)->setValue(numeric_limits<double>::quiet_NaN());
                       if (l3p->caselessStrCmp(name, "notanumber"))   (yyval.astnode)->setValue(numeric_limits<double>::quiet_NaN());
                     }
                     if (!l3p->avocsymbol && type==AST_NAME_AVOGADRO) {
                       //Don't parse 'avogadro' as a csymbol.
                       (yyval.astnode)->setName(name.c_str());
                       (yyval.astnode)->setType(AST_NAME);
                     }
                   }
        ;}
    break;

  case 8:

/* Line 1464 of yacc.c  */
#line 132 "L3Parser.ypp"
    {(yyval.astnode) = (yyvsp[(2) - (3)].astnode);;}
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 133 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_POWER); (yyval.astnode)->addChild((yyvsp[(1) - (3)].astnode)); (yyval.astnode)->addChild((yyvsp[(3) - (3)].astnode));;}
    break;

  case 10:

/* Line 1464 of yacc.c  */
#line 134 "L3Parser.ypp"
    {
                  if ((yyvsp[(1) - (3)].astnode)->getType()==AST_TIMES) {
                    (yyval.astnode) = (yyvsp[(1) - (3)].astnode);
                    (yyval.astnode)->addChild((yyvsp[(3) - (3)].astnode));
                  }
                  else {
                    (yyval.astnode) = new ASTNode(AST_TIMES);
                    (yyval.astnode)->addChild((yyvsp[(1) - (3)].astnode));
                    (yyval.astnode)->addChild((yyvsp[(3) - (3)].astnode));
                  }
                ;}
    break;

  case 11:

/* Line 1464 of yacc.c  */
#line 145 "L3Parser.ypp"
    {
                  if ((yyvsp[(1) - (3)].astnode)->getType()==AST_PLUS) {
                    (yyval.astnode) = (yyvsp[(1) - (3)].astnode);
                    (yyval.astnode)->addChild((yyvsp[(3) - (3)].astnode));
                  }
                  else {
                    (yyval.astnode) = new ASTNode(AST_PLUS);
                    (yyval.astnode)->addChild((yyvsp[(1) - (3)].astnode));
                    (yyval.astnode)->addChild((yyvsp[(3) - (3)].astnode));
                  }
                ;}
    break;

  case 12:

/* Line 1464 of yacc.c  */
#line 156 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_DIVIDE); (yyval.astnode)->addChild((yyvsp[(1) - (3)].astnode)); (yyval.astnode)->addChild((yyvsp[(3) - (3)].astnode));;}
    break;

  case 13:

/* Line 1464 of yacc.c  */
#line 157 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_MINUS); (yyval.astnode)->addChild((yyvsp[(1) - (3)].astnode)); (yyval.astnode)->addChild((yyvsp[(3) - (3)].astnode));;}
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 158 "L3Parser.ypp"
    {(yyval.astnode) = l3p->createModuloTree((yyvsp[(1) - (3)].astnode), (yyvsp[(3) - (3)].astnode));;}
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 159 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_RELATIONAL_GT); (yyval.astnode)->addChild((yyvsp[(1) - (3)].astnode)); (yyval.astnode)->addChild((yyvsp[(3) - (3)].astnode));;}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 160 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_RELATIONAL_LT); (yyval.astnode)->addChild((yyvsp[(1) - (3)].astnode)); (yyval.astnode)->addChild((yyvsp[(3) - (3)].astnode));;}
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 161 "L3Parser.ypp"
    {
                  if (l3p->collapseminus) {
                    if ((yyvsp[(2) - (2)].astnode)->getType()==AST_REAL) {
                      (yyval.astnode) = (yyvsp[(2) - (2)].astnode);
                      (yyval.astnode)->setValue(-(yyval.astnode)->getReal());
                    }
                    else if ((yyvsp[(2) - (2)].astnode)->getType()==AST_INTEGER) {
                      (yyval.astnode) = (yyvsp[(2) - (2)].astnode);
                      (yyval.astnode)->setValue(-(yyval.astnode)->getInteger());
                    }
                    else if ((yyvsp[(2) - (2)].astnode)->getType()==AST_REAL_E) {
                      (yyval.astnode) = (yyvsp[(2) - (2)].astnode);
                      (yyval.astnode)->setValue(-(yyval.astnode)->getMantissa(), (yyval.astnode)->getExponent());
                    }
                    else if ((yyvsp[(2) - (2)].astnode)->getType()==AST_RATIONAL) {
                      (yyval.astnode) = (yyvsp[(2) - (2)].astnode);
                      (yyval.astnode)->setValue(-(yyval.astnode)->getNumerator(), (yyval.astnode)->getDenominator());
                    }
                    else if ((yyvsp[(2) - (2)].astnode)->getType()==AST_MINUS && (yyvsp[(2) - (2)].astnode)->getNumChildren()==1) {
                      (yyval.astnode) = (yyvsp[(2) - (2)].astnode)->getChild(0);
                      (yyvsp[(2) - (2)].astnode)->removeChild(0);
                      delete (yyvsp[(2) - (2)].astnode);
                    }
                    else {
                      (yyval.astnode) = new ASTNode(AST_MINUS);    
                      (yyval.astnode)->addChild((yyvsp[(2) - (2)].astnode));
                    }
                  }
                  else {
                    (yyval.astnode) = new ASTNode(AST_MINUS);
                    (yyval.astnode)->addChild((yyvsp[(2) - (2)].astnode));
                  }
                ;}
    break;

  case 18:

/* Line 1464 of yacc.c  */
#line 194 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_RELATIONAL_GEQ); (yyval.astnode)->addChild((yyvsp[(1) - (4)].astnode)); (yyval.astnode)->addChild((yyvsp[(4) - (4)].astnode));;}
    break;

  case 19:

/* Line 1464 of yacc.c  */
#line 195 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_RELATIONAL_LEQ); (yyval.astnode)->addChild((yyvsp[(1) - (4)].astnode)); (yyval.astnode)->addChild((yyvsp[(4) - (4)].astnode));;}
    break;

  case 20:

/* Line 1464 of yacc.c  */
#line 196 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_RELATIONAL_EQ); (yyval.astnode)->addChild((yyvsp[(1) - (4)].astnode)); (yyval.astnode)->addChild((yyvsp[(4) - (4)].astnode));;}
    break;

  case 21:

/* Line 1464 of yacc.c  */
#line 197 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_RELATIONAL_NEQ); (yyval.astnode)->addChild((yyvsp[(1) - (4)].astnode)); (yyval.astnode)->addChild((yyvsp[(4) - (4)].astnode));;}
    break;

  case 22:

/* Line 1464 of yacc.c  */
#line 198 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_RELATIONAL_NEQ); (yyval.astnode)->addChild((yyvsp[(1) - (4)].astnode)); (yyval.astnode)->addChild((yyvsp[(4) - (4)].astnode));;}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 199 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_RELATIONAL_NEQ); (yyval.astnode)->addChild((yyvsp[(1) - (4)].astnode)); (yyval.astnode)->addChild((yyvsp[(4) - (4)].astnode));;}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 200 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_LOGICAL_AND); (yyval.astnode)->addChild((yyvsp[(1) - (4)].astnode)); (yyval.astnode)->addChild((yyvsp[(4) - (4)].astnode));;}
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 201 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_LOGICAL_OR); (yyval.astnode)->addChild((yyvsp[(1) - (4)].astnode)); (yyval.astnode)->addChild((yyvsp[(4) - (4)].astnode));;}
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 202 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_LOGICAL_NOT); (yyval.astnode)->addChild((yyvsp[(2) - (2)].astnode));;}
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 203 "L3Parser.ypp"
    {
                   (yyval.astnode) = new ASTNode(AST_FUNCTION);
                   string name(*(yyvsp[(1) - (3)].word));
                   (yyval.astnode)->setName((yyvsp[(1) - (3)].word)->c_str());
                   if (l3p->model == NULL || l3p->model->getFunctionDefinition(name) == NULL) {
                     //The symbol is not used in any other mathematical context in the SBML model, so we can see if it matches a list of pre-defined names
                     ASTNodeType_t type = l3p->getFunctionFor(name);
                     if (type != AST_UNKNOWN) (yyval.astnode)->setType(type);
                     if (l3p->checkNumArguments((yyval.astnode))) YYABORT;
                   }
        ;}
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 214 "L3Parser.ypp"
    {
                   (yyval.astnode) = (yyvsp[(3) - (4)].astnode);
                   string name(*(yyvsp[(1) - (4)].word));
                   (yyval.astnode)->setName((yyvsp[(1) - (4)].word)->c_str());
                   (yyval.astnode)->setType(AST_FUNCTION);
                   if (l3p->model == NULL || l3p->model->getFunctionDefinition(name) == NULL) {
                     //The symbol is not used in any other mathematical context in the SBML model, so we can see if it matches a list of pre-defined names
                     ASTNodeType_t type = l3p->getFunctionFor(name);
                     if (type != AST_UNKNOWN) (yyval.astnode)->setType(type);
                     if (type==AST_FUNCTION_ROOT && l3p->caselessStrCmp(name, "sqrt")) {
                       //Add a '2' node before the existing child.
                       ASTNode* int2 = new ASTNode(AST_INTEGER);
                       int2->setValue(2);
                       (yyval.astnode)->prependChild(int2);
                     }
                     if (type==AST_FUNCTION_POWER && l3p->caselessStrCmp(name, "sqr")) {
                       //Add a '2' node after the existing child.
                       ASTNode* int2 = new ASTNode(AST_INTEGER);
                       int2->setValue(2);
                       (yyval.astnode)->addChild(int2);
                     }
                     if (type==AST_FUNCTION_LOG && l3p->caselessStrCmp(name, "log10")) {
                       //Add a '10' node before the existing child.
                       ASTNode* int10 = new ASTNode(AST_INTEGER);
                       int10->setValue(10);
                       (yyval.astnode)->prependChild(int10);
                     }
                     if (type==AST_FUNCTION_LOG && l3p->caselessStrCmp(name, "log")) {
                       //If there is exactly one argument, change it to log10, ln, or give a special error message, depending on a user setting (by default, parse to log10).
                       if ((yyval.astnode)->getNumChildren() == 1) {
                         ASTNode* int10;
                         switch(l3p->parselog) {
                         case L3P_PARSE_LOG_AS_LOG10:
                           int10 = new ASTNode(AST_INTEGER);
                           int10->setValue(10);
                           (yyval.astnode)->prependChild(int10);
                           break;
                         case L3P_PARSE_LOG_AS_LN:
                           (yyval.astnode)->setType(AST_FUNCTION_LN);
                           break;
                         case L3P_PARSE_LOG_AS_ERROR:
                           l3p->setError("Writing a function as 'log(x)' was legal in the L1 parser, but translated as the natural log, not the base-10 log.  This construct is disallowed entirely as being ambiguous, and you are encouraged instead to use 'ln(x)', 'log10(x)', or 'log(base, x)'.");
                           YYABORT;
                         }
                       }
                     }
                   }
                   if (l3p->checkNumArguments((yyval.astnode))) YYABORT;
        ;}
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 265 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(); (yyval.astnode)->setValue((yyvsp[(1) - (1)].numdouble));;}
    break;

  case 30:

/* Line 1464 of yacc.c  */
#line 266 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(); (yyval.astnode)->setValue((yyvsp[(1) - (1)].mantissa), l3p->exponent);;}
    break;

  case 31:

/* Line 1464 of yacc.c  */
#line 267 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(); (yyval.astnode)->setValue((yyvsp[(1) - (1)].numlong));;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 268 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(); (yyval.astnode)->setValue((yyvsp[(1) - (1)].rational), l3p->denominator);;}
    break;

  case 33:

/* Line 1464 of yacc.c  */
#line 269 "L3Parser.ypp"
    {
                  (yyval.astnode) = (yyvsp[(1) - (2)].astnode);
                  if ((yyval.astnode)->getUnits() != "") {
                    l3p->setError("Can't use " + *(yyvsp[(2) - (2)].word) + " as a unit, because the unit is already set for this number.");
                    YYERROR;
                  }
                  if (!l3p->parseunits) {
                    l3p->setError("The ability to associate units with numbers has been disabled in this software.");
                    YYERROR;
                  }
                  (yyval.astnode)->setUnits(*(yyvsp[(2) - (2)].word));
               ;}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 283 "L3Parser.ypp"
    {(yyval.astnode) = new ASTNode(AST_FUNCTION); (yyval.astnode)->addChild((yyvsp[(1) - (1)].astnode));;}
    break;

  case 35:

/* Line 1464 of yacc.c  */
#line 284 "L3Parser.ypp"
    {(yyval.astnode) = (yyvsp[(1) - (3)].astnode);  (yyval.astnode)->addChild((yyvsp[(3) - (3)].astnode));;}
    break;



/* Line 1464 of yacc.c  */
#line 1808 "L3Parser.tab.cpp"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 1684 of yacc.c  */
#line 287 "L3Parser.ypp"



void sbml_yyerror(char const *s)
{
  l3p->setError(s);
}

int sbml_yylex(void)
{
  char cc = 0;
  l3p->input.get(cc);

  //If we're done with the input:
  if (l3p->input.eof()) {
    return 0;
  }
  //If something else went wrong:
  if (!l3p->input.good()) {
    l3p->setError("The input is no longer good, for an unknown reason.");
    return -1;
  }

  // Skip white space.
  while ((cc == ' ' || cc == '\t' || cc == '\n' || cc == '\r')
         && !l3p->input.eof()) {
    l3p->input.get(cc);
  }
  if (l3p->input.eof()) return 0;

  // Parse words
  if (isalpha(cc) || cc == '_') {
    string word;
    while ((isalpha(cc) || isdigit(cc) || cc == '_') && !l3p->input.eof()) {
      word += cc;
      l3p->input.get(cc);
    }
    if (!l3p->input.eof()) {
      l3p->input.unget();
    }
    sbml_yylval.word = l3p->addWord(word);
    //cout << "\tRead word '" << word << "'." << endl;
    return SYMBOL;
  }

  // Parse numbers
  if (isdigit(cc) || (cc=='.' && isdigit(l3p->input.peek()))) {
    double number;
    long numlong;
    bool isdouble = false;
    l3p->input.unget();
    if (cc != '.') {
      l3p->input >> numlong;
    }
    else {
      numlong = 0;
    }
    if (l3p->input.peek() == '.') {
      isdouble = true;
      number = numlong;
      l3p->input.get();
      if (isdigit(l3p->input.peek())) {
        streampos numbegin = l3p->input.tellg();
        l3p->input >> numlong;
        streampos numend = l3p->input.tellg();
        double fraction = numlong/pow(10.0, static_cast<long>(numend-numbegin));
        number += fraction;
      }
    }
    if (l3p->input.peek() == 'e' || l3p->input.peek() == 'E') {
      l3p->input.get();
      cc = l3p->input.get();
      if (!(isdigit(cc) || cc=='-' || cc=='+')) {
        l3p->input.unget();
        l3p->input.unget();
      }
      else {
        if (!isdouble) {
          //It is now!
          number = numlong;
        }
        bool isneg = false;
        if (cc=='-') {
          isneg = true;
        }
        else if (isdigit(cc)) {
          l3p->input.unget();
        }
        l3p->input >> numlong;
        if (isneg) {
          numlong = -numlong;
        }
        l3p->exponent = numlong;
        sbml_yylval.mantissa = number;
        return E_NOTATION;
      }
    }
    if (isdouble) {
      sbml_yylval.numdouble = number;
      return DOUBLE;
    }
    else {
      sbml_yylval.numlong = numlong;
      return INTEGER;
    }
  }
  else if (cc=='(') {
    streampos rationalbegin = l3p->input.tellg();
    cc = l3p->input.get();
    if (cc== '-' && isdigit(l3p->input.peek()) || isdigit(cc)) {
      l3p->input.unget();
      long numerator;
      l3p->input >> numerator;
      cc = l3p->input.get();
      if (cc=='/') {
        cc = l3p->input.get();
        if (cc== '-' && isdigit(l3p->input.peek()) || isdigit(cc)) {
          l3p->input.unget();
          long denominator;
          l3p->input >> denominator; 
          cc = l3p->input.get();
          if (cc==')') {
            //Actually a rational number!
            sbml_yylval.rational = numerator;
            l3p->denominator = denominator;
            return RATIONAL;
          }
        }
      }
    }
    l3p->input.seekg(rationalbegin, ios::beg); // Not actually a rational number.
    return '(';
  }

  //Otherwise, return the character we are looking at (like '*', '+', etc.
  return cc;
}

L3Parser::L3Parser()
  : input()
  , outputNode(NULL)
  , error()
  , words()
  , exponent(0)
  , denominator(0)
  , defaultParserSettings()
  , model(NULL)
  , parselog(L3P_PARSE_LOG_AS_LOG10)
  , collapseminus(L3P_EXPAND_UNARY_MINUS)
  , parseunits(L3P_PARSE_UNITS)
  , avocsymbol(L3P_AVOGADRO_IS_CSYMBOL)
{
}

L3Parser::~L3Parser ()
{
  for (map<string, string*>::iterator word = words.begin(); word != words.end(); word++) {
    delete (*word).second;
  }
}

ASTNodeType_t L3Parser::getSymbolFor(string name) const
{
  if (caselessStrCmp(name, "true"))         return AST_CONSTANT_TRUE;
  if (caselessStrCmp(name, "false"))        return AST_CONSTANT_FALSE;
  if (caselessStrCmp(name, "pi"))           return AST_CONSTANT_PI;
  if (caselessStrCmp(name, "exponentiale")) return AST_CONSTANT_E;
  if (caselessStrCmp(name, "avogadro"))     return AST_NAME_AVOGADRO;
  if (caselessStrCmp(name, "time"))         return AST_NAME_TIME;
  if (caselessStrCmp(name, "inf"))          return AST_REAL;
  if (caselessStrCmp(name, "infinity"))     return AST_REAL;
  if (caselessStrCmp(name, "nan"))          return AST_REAL;
  if (caselessStrCmp(name, "notanumber"))   return AST_REAL;
  return AST_UNKNOWN;
}

ASTNodeType_t L3Parser::getFunctionFor(string name) const
{
  if (caselessStrCmp(name, "abs"))      return AST_FUNCTION_ABS;
  if (caselessStrCmp(name, "acos"))     return AST_FUNCTION_ARCCOS;
  if (caselessStrCmp(name, "arccos"))   return AST_FUNCTION_ARCCOS;
  if (caselessStrCmp(name, "acosh"))    return AST_FUNCTION_ARCCOSH;
  if (caselessStrCmp(name, "arccosh"))  return AST_FUNCTION_ARCCOSH;
  if (caselessStrCmp(name, "acot"))     return AST_FUNCTION_ARCCOT;
  if (caselessStrCmp(name, "arccot"))   return AST_FUNCTION_ARCCOT;
  if (caselessStrCmp(name, "acoth"))    return AST_FUNCTION_ARCCOTH;
  if (caselessStrCmp(name, "arccoth"))  return AST_FUNCTION_ARCCOTH;
  if (caselessStrCmp(name, "acsc"))     return AST_FUNCTION_ARCCSC;
  if (caselessStrCmp(name, "arccsc"))   return AST_FUNCTION_ARCCSC;
  if (caselessStrCmp(name, "acsch"))    return AST_FUNCTION_ARCCSCH;
  if (caselessStrCmp(name, "arccsch"))  return AST_FUNCTION_ARCCSCH;
  if (caselessStrCmp(name, "asec"))     return AST_FUNCTION_ARCSEC;
  if (caselessStrCmp(name, "arcsec"))   return AST_FUNCTION_ARCSEC;
  if (caselessStrCmp(name, "asech"))    return AST_FUNCTION_ARCSECH;
  if (caselessStrCmp(name, "arcsech"))  return AST_FUNCTION_ARCSECH;
  if (caselessStrCmp(name, "asin"))     return AST_FUNCTION_ARCSIN;
  if (caselessStrCmp(name, "arcsin"))   return AST_FUNCTION_ARCSIN;
  if (caselessStrCmp(name, "atan"))     return AST_FUNCTION_ARCTAN;
  if (caselessStrCmp(name, "arctan"))   return AST_FUNCTION_ARCTAN;
  if (caselessStrCmp(name, "atanh"))    return AST_FUNCTION_ARCTANH;
  if (caselessStrCmp(name, "arctanh"))  return AST_FUNCTION_ARCTANH;
  if (caselessStrCmp(name, "ceil"))     return AST_FUNCTION_CEILING;
  if (caselessStrCmp(name, "ceiling"))  return AST_FUNCTION_CEILING;
  if (caselessStrCmp(name, "cos"))      return AST_FUNCTION_COS;
  if (caselessStrCmp(name, "cosh"))     return AST_FUNCTION_COSH;
  if (caselessStrCmp(name, "cot"))      return AST_FUNCTION_COT;
  if (caselessStrCmp(name, "coth"))     return AST_FUNCTION_COTH;
  if (caselessStrCmp(name, "csc"))      return AST_FUNCTION_CSC;
  if (caselessStrCmp(name, "csch"))     return AST_FUNCTION_CSCH;
  if (caselessStrCmp(name, "delay"))    return AST_FUNCTION_DELAY;
  if (caselessStrCmp(name, "exp"))      return AST_FUNCTION_EXP;
  if (caselessStrCmp(name, "factorial")) return AST_FUNCTION_FACTORIAL;
  if (caselessStrCmp(name, "floor"))    return AST_FUNCTION_FLOOR;
  if (caselessStrCmp(name, "log"))      return AST_FUNCTION_LOG;
  if (caselessStrCmp(name, "ln"))       return AST_FUNCTION_LN;
  if (caselessStrCmp(name, "log10"))    return AST_FUNCTION_LOG;
  if (caselessStrCmp(name, "piecewise")) return AST_FUNCTION_PIECEWISE;
  if (caselessStrCmp(name, "power"))    return AST_POWER;
  if (caselessStrCmp(name, "sqr"))      return AST_FUNCTION_POWER;
  if (caselessStrCmp(name, "sqrt"))     return AST_FUNCTION_ROOT;
  if (caselessStrCmp(name, "root"))     return AST_FUNCTION_ROOT;
  if (caselessStrCmp(name, "sec"))      return AST_FUNCTION_SEC;
  if (caselessStrCmp(name, "sech"))     return AST_FUNCTION_SECH;
  if (caselessStrCmp(name, "sin"))      return AST_FUNCTION_SIN;
  if (caselessStrCmp(name, "sinh"))     return AST_FUNCTION_SINH;
  if (caselessStrCmp(name, "tan"))      return AST_FUNCTION_TAN;
  if (caselessStrCmp(name, "tanh"))     return AST_FUNCTION_TANH;
  if (caselessStrCmp(name, "and"))      return AST_LOGICAL_AND;
  if (caselessStrCmp(name, "not"))      return AST_LOGICAL_NOT;
  if (caselessStrCmp(name, "or"))       return AST_LOGICAL_OR;
  if (caselessStrCmp(name, "xor"))      return AST_LOGICAL_XOR;
  if (caselessStrCmp(name, "eq"))       return AST_RELATIONAL_EQ;
  if (caselessStrCmp(name, "equals"))   return AST_RELATIONAL_EQ;
  if (caselessStrCmp(name, "geq"))      return AST_RELATIONAL_GEQ;
  if (caselessStrCmp(name, "gt"))       return AST_RELATIONAL_GT;
  if (caselessStrCmp(name, "leq"))      return AST_RELATIONAL_LEQ;
  if (caselessStrCmp(name, "lt"))       return AST_RELATIONAL_LT;
  if (caselessStrCmp(name, "neq"))      return AST_RELATIONAL_NEQ;
  if (caselessStrCmp(name, "divide"))   return AST_DIVIDE;
  if (caselessStrCmp(name, "minus"))    return AST_MINUS;
  if (caselessStrCmp(name, "plus"))     return AST_PLUS;
  if (caselessStrCmp(name, "times"))    return AST_TIMES;
  return AST_UNKNOWN;
}

ASTNode* L3Parser::createModuloTree(ASTNode* x, ASTNode* y) const
{
  if (x==NULL || y==NULL) return NULL;
  ASTNode* pASTNode = new ASTNode(); 
  //The following code was lifted wholesale from Copasi's  CEvaluationNodeOperator::createModuloTree.  Thanks, Copasi!

  // Frank noticed that this should actually be implemented as a
  // piecewise function because if one of the arguments is
  // negative, the definition is different
  pASTNode->setType(AST_FUNCTION_PIECEWISE);
  // the first child is the true branch
  // x%y -> x-ceil(x/y)*y
  ASTNode* pASTNodeTrue = new ASTNode();
  pASTNodeTrue->setType(AST_MINUS);
  ASTNode* tmpASTNode = new ASTNode(AST_DIVIDE);
  tmpASTNode->addChild(x);
  tmpASTNode->addChild(y);
  ASTNode* tmpASTNode2 = new ASTNode(AST_FUNCTION_CEILING);
  tmpASTNode2->addChild(tmpASTNode);
  tmpASTNode = new ASTNode(AST_TIMES);
  tmpASTNode->addChild(new ASTNode(*y));
  tmpASTNode->addChild(tmpASTNode2);
  pASTNodeTrue->addChild(new ASTNode(*x));
  pASTNodeTrue->addChild(tmpASTNode);
  pASTNode->addChild(pASTNodeTrue);
  // now comes the condition
  // if exactly one of the arguments to modulo is a negative number
  // we use the ceil branch, else we use the floor branch
  // x < 0 xor y < 0
  // xor
  ASTNode* pASTNodeCondition = new ASTNode();
  pASTNodeCondition->setType(AST_LOGICAL_XOR);
  // x < 0
  // <
  tmpASTNode = new ASTNode(AST_RELATIONAL_LT);
  // x
  tmpASTNode->addChild(new ASTNode(*x));
  // 0
  tmpASTNode2 = new ASTNode(AST_INTEGER);
  tmpASTNode2->setValue(0);
  tmpASTNode->addChild(tmpASTNode2);
  pASTNodeCondition->addChild(tmpASTNode);
  // y < 0
  // <
  tmpASTNode = new ASTNode(AST_RELATIONAL_LT);
  // y
  tmpASTNode->addChild(new ASTNode(*y));
  // 0
  tmpASTNode2 = new ASTNode(AST_INTEGER);
  tmpASTNode2->setValue(0);
  tmpASTNode->addChild(tmpASTNode2);
  pASTNodeCondition->addChild(tmpASTNode);
  pASTNode->addChild(pASTNodeCondition);
  // last is the false branch
  // x%y -> x-floor(x/y)*y
  ASTNode* pASTNodeFalse = new ASTNode();
  pASTNodeFalse->setType(AST_MINUS);
  tmpASTNode = new ASTNode(AST_DIVIDE);
  tmpASTNode->addChild(new ASTNode(*x));
  tmpASTNode->addChild(new ASTNode(*y));
  tmpASTNode2 = new ASTNode(AST_FUNCTION_FLOOR);
  tmpASTNode2->addChild(tmpASTNode);
  tmpASTNode = new ASTNode(AST_TIMES);
  tmpASTNode->addChild(new ASTNode(*y));
  tmpASTNode->addChild(tmpASTNode2);
  pASTNodeFalse->addChild(new ASTNode(*x));
  pASTNodeFalse->addChild(tmpASTNode);
  pASTNode->addChild(pASTNodeFalse);
  return pASTNode;
}

void L3Parser::setParseLog(l3p_log_type parseas)
{
  parselog = parseas;
}

void L3Parser::setCollapseMinus(bool collapse)
{
  collapseminus = collapse;
}

void L3Parser::setParseUnits(bool units)
{
  parseunits = units;
}

void L3Parser::setAvoCsymbol(bool avo)
{
  avocsymbol = avo;
}

bool L3Parser::caselessStrCmp(const string& lhs, const string& rhs) const
{
  if (lhs.size() != rhs.size()) return false;

  for (size_t i = 0; i < lhs.size(); ++i) {
    if (toupper(lhs[i]) != toupper(rhs[i])) return false;
  }
  return true;

}

void L3Parser::setInput(const char* c)
{
  input.clear();
  input.str(c);
}

void L3Parser::setError(const char* c)
{
  string err = c;
  setError(err);
}

void L3Parser::setError(string c)
{
  stringstream err;
  streampos position = input.tellg();
  if (position== (streampos)-1) {
    position = input.str().size();
  }
  err << "Error when parsing input '" << input.str() << "' at position " << position << ":  " << c;
  error = err.str();
}

void L3Parser::clear()
{
  input.clear();
  input.str("");
  outputNode = NULL;
  error = "";
  model = defaultParserSettings.getModel();
  parselog = defaultParserSettings.getParseLog();
  collapseminus = defaultParserSettings.getCollapseMinus();
  parseunits = defaultParserSettings.getParseUnits();
  avocsymbol = defaultParserSettings.getAvogadroCsymbol();
}

string L3Parser::getError()
{
  return error;
}
    
string* L3Parser::addWord(const std::string& word)
{
  //cout << "The word is: " << word << endl;
  map<string, string*>::iterator found = words.find(word);
  if (found != words.end()) {
    return (*found).second;
  }
  else {
    string* savedword = new string(word);
    words.insert(make_pair(word, savedword));
    return savedword;
  }
}

bool L3Parser::checkNumArguments(const ASTNode* function)
{
  unsigned int children = function->getNumChildren();
  stringstream error;
  string name = "";
  if (function->isOperator()) {
    name = function->getOperatorName();
  }
  else {
    name = function->getName();
  }
  error << "The function '" << name << "' takes ";
  switch(function->getType()) {
  case AST_FUNCTION_ABS:
  case AST_FUNCTION_ARCCOS:
  case AST_FUNCTION_ARCCOSH:
  case AST_FUNCTION_ARCCOT:
  case AST_FUNCTION_ARCCOTH:
  case AST_FUNCTION_ARCCSC:
  case AST_FUNCTION_ARCCSCH:
  case AST_FUNCTION_ARCSEC:
  case AST_FUNCTION_ARCSECH:
  case AST_FUNCTION_ARCSIN:
  case AST_FUNCTION_ARCSINH:
  case AST_FUNCTION_ARCTAN:
  case AST_FUNCTION_ARCTANH:
  case AST_FUNCTION_CEILING:
  case AST_FUNCTION_COS:
  case AST_FUNCTION_COSH:
  case AST_FUNCTION_COT:
  case AST_FUNCTION_COTH:
  case AST_FUNCTION_CSC:
  case AST_FUNCTION_CSCH:
  case AST_FUNCTION_EXP:
  case AST_FUNCTION_FACTORIAL:
  case AST_FUNCTION_FLOOR:
  case AST_FUNCTION_LN:
  case AST_FUNCTION_SEC:
  case AST_FUNCTION_SECH:
  case AST_FUNCTION_SIN:
  case AST_FUNCTION_SINH:
  case AST_FUNCTION_TAN:
  case AST_FUNCTION_TANH:
  case AST_LOGICAL_NOT:

    if (children != 1) {
      error << "exactly one argument, but " << children << " were found.";
      l3p->setError(error.str());
      return true;
    }
    return false;
  case AST_DIVIDE:
  case AST_POWER:
  case AST_RELATIONAL_NEQ:
  case AST_FUNCTION_DELAY:
  case AST_FUNCTION_POWER:
  case AST_FUNCTION_LOG:       // a log ASTNode has a child for base

    if (children != 2) {
      error << "exactly two arguments, but " << children << " were found.";
      l3p->setError(error.str());
      return true;
    }
    return false;

  case AST_RELATIONAL_EQ:
  case AST_RELATIONAL_GEQ:
  case AST_RELATIONAL_GT:
  case AST_RELATIONAL_LEQ:
  case AST_RELATIONAL_LT:
    if (children <= 1) {
      error << "at least two arguments, but " << children << " were found.";
      l3p->setError(error.str());
      return true;
    }
    return false;

  case AST_FUNCTION_PIECEWISE:
    if (children == 0) {
      error << "at least one argument, but none were found.";
      l3p->setError(error.str());
      return true;
    }
    return false;

  case AST_FUNCTION_ROOT:
  case AST_MINUS:
    if (children < 1 || children > 2) {
      error << "exactly one or two arguments, but " << children << " were found.";
      l3p->setError(error.str());
      return true;
    }
    return false;
      
  case AST_TIMES:
  case AST_PLUS:
  case AST_LOGICAL_AND:
  case AST_LOGICAL_OR:
  case AST_LOGICAL_XOR:
  default:
    //n-ary 0 or more arguments
    return false;
  }
}

L3ParserSettings L3Parser::getDefaultParserSettings()
{
  return defaultParserSettings;
}


ASTNode *
L3Parser::parseL3Formula (std::string formula)
{
  if (l3p==NULL) {
    l3p = new L3Parser();
  }
  L3ParserSettings l3ps = l3p->getDefaultParserSettings();
  return L3Parser::parseL3Formula(formula, l3ps);
}


ASTNode *
L3Parser::parseL3Formula (std::string formula, L3ParserSettings settings)
{
  if (l3p==NULL) {
    l3p = new L3Parser();
  }
  l3p->clear();
  l3p->setInput(formula.c_str());
  l3p->model = settings.getModel();
  l3p->parselog = settings.getParseLog();
  l3p->collapseminus = settings.getCollapseMinus();
  l3p->parseunits = settings.getParseUnits();
  l3p->avocsymbol = settings.getAvogadroCsymbol();
  sbml_yyparse();
  return l3p->outputNode;
  
}


char* 
L3Parser::getLastParseL3Error()
{
  //cout << l3p->getError() << endl;
  return safe_strdup(l3p->getError().c_str());
}


LIBSBML_EXTERN
ASTNode_t *
SBML_parseL3Formula (const char *formula)
{
  return L3Parser::parseL3Formula(formula);
}


LIBSBML_EXTERN
ASTNode_t *
SBML_parseL3FormulaWithSettings (const char *formula, L3ParserSettings_t * settings)
{
  return L3Parser::parseL3Formula(formula, *(settings));
}


LIBSBML_EXTERN
ASTNode_t *
SBML_parseL3FormulaWithModel (const char *formula, Model_t * model)
{
  return L3Parser::parseL3Formula(formula, model);
}


LIBSBML_EXTERN
char*
SBML_getLastParseL3Error()
{
  return L3Parser::getLastParseL3Error();
}


