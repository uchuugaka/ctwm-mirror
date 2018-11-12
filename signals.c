/*
 * Signal handlers
 */

#include "ctwm.h"

#include <signal.h>

#include "signals.h"
#include "unistd.h"


/* Our backends */
static void sh_restart(int signum);


/**
 * Setup signal handlers (run during startup)
 */
void
setup_signal_handlers(void)
{
	// INT/QUIT/TERM: shutdown
	// XXX Wildly unsafe handler; to be reworked
	signal(SIGINT, Done);
	signal(SIGQUIT, Done);
	signal(SIGTERM, Done);

	// SIGHUP: restart
	signal(SIGHUP, sh_restart);

	// We don't use alarm(), but if we get the stray signal we shouldn't
	// die...
	signal(SIGALRM, SIG_IGN);

	// This should be set by default, but just in case; explicitly don't
	// leave zombies.
	signal(SIGCHLD, SIG_IGN);

	return;
}



/*
 * Internal backend bits
 */

/**
 * Set flag to restart.  Backend for SIGHUP.
 */
static void
sh_restart(int signum)
{
	// Signal handler; stdio isn't async-signal-safe, write(2) is
	const char srf[] = ":  signal received, setting restart flag\n";
	write(2, ProgramName, ProgramNameLen);
	write(2, srf, sizeof(srf));
	RestartFlag = true;
}
