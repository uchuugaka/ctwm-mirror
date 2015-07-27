#
# Setup some vars we use in the configure/build process
#

# The dir in which we ship pregen'd source files
set(GENSRCDIR ${CMAKE_CURRENT_SOURCE_DIR}/gen)

# Where our doc files are (and where pregen'd docs might be)
set(SRCDOCDIR ${CMAKE_SOURCE_DIR}/doc)


# Our base set of sources
set(CTWMSRC
	add_window.c
	clargs.c
	clicktofocus.c
	ctwm.c
	ctwm_atoms.c
	cursor.c
	events.c
	gc.c
	gram.tab.c
	iconmgr.c
	icons.c
	lex.c
	list.c
	menus.c
	mwmhints.c
	otp.c
	parse.c
	resize.c
	session.c
	util.c
	version.c
	vscreen.c
	windowbox.c
	workmgr.c
)


# Libs to link in (init empty list)
set(CTWMLIBS)


# Our normal set of warning flags
set(STD_WARNS
	-Wall
	-Wshadow -Wstrict-prototypes -Wmissing-prototypes -Wundef
	-Wredundant-decls -Wcast-align -Wcast-qual -Wchar-subscripts
	-Winline -Wnested-externs -Wmissing-declarations
)