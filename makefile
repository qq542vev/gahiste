#!/usr/bin/make -f

### File: makefile
##
## zbasu lo galfi liste be pi'o la'o zoi IME zoi
##
## Usage:
##
## ------ Text ------
## make -f makefile
## ------------------
##
## Metadata:
##
##   id - cb29c2da-5cf5-4032-a0ce-bfbc95a8d927
##   author - <qq542vev at https://purl.org/meta/me/>
##   version - 0.0.1
##   created - 2026-03-28
##   modified - 2026-03-28
##   copyright - Copyright (C) 2026-2026 qq542vev. All rights reserved.
##   license - <GPL-3.0-only at https://www.gnu.org/licenses/gpl-3.0.txt>
##   depends - awk, echo, rm, sort
##   conforms-to - <https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html>
##
## See Also:
##
##   * <Project homepage at https://github.com/qq542vev/kanajbo>
##   * <Bag report at https://github.com/qq542vev/kanajbo/issues>

# Sp Targets
# ==========

.POSIX:

.PHONY: ro gboard vimcu zahurehu sidju terfarvi

.SILENT: sidju terfarvi

# Macro
# =====

TERFARVI = 0.0.1
VASRU = selzbasu
RAFSTE = rafsi.tsv
ROLSINXA = at bs noda
GIMRAF = $(ROLSINXA:%=-%-gimrafsi.txt)
RAFGIM = $(ROLSINXA:%=-%-rafgismu.txt)
MKDIR = mkdir -p -- '$(@D)'
SET = set -efu -o pipefail
BREDI = \
	$(SET); $(MKDIR); \
	case '$(@F)' in \
		*'-at-'*) export SINXA='@';; \
		*'-bs-'*) export SINXA='\';; \
	esac;
GBOARD = $(GIMRAF:%=$(VASRU)/gboard%) $(RAFGIM:%=$(VASRU)/gboard%)


# zbasu
# =====

ro: gboard

# Gboard
# ------

gboard: $(GBOARD)

$(GIMRAF:%=$(VASRU)/gboard%): $(RAFSTE)
	$(BREDI) awk -F '\t' -- 'BEGIN { print("# Gboard Dictionary version:2"); print("# Gboard Dictionary format:shortcut	word	language_tag	pos_tag"); } { printf("%s\t%s\tjbo\t\n", ENVIRON["SINXA"] $$1, $$2); }' '$(<)' | sort -o '$(@)'

$(RAFGIM:%=$(VASRU)/gboard%): $(RAFSTE)
	$(BREDI) awk -F '\t' -- 'BEGIN { print("# Gboard Dictionary version:2"); print("# Gboard Dictionary format:shortcut	word	language_tag	pos_tag"); } { printf("%s\t%s\tjbo\t\n", ENVIRON["SINXA"] $$2, $$1); }' '$(<)' | sort -o '$(@)'

# vimcu
# =====

vimcu:
	rm -f -- $(GBOARD)

zahurehu: vimcu
	$(MAKE)

# notci
# =====

sidju:
	echo "zbasu lo galfi liste be pi'o la'o zoi IME zoi"
	echo
	echo "pilno tadji:"
	echo "  make [OPTION...] [MACRO=VALUE...] [TARGET...]"
	echo
	echo "TARGET:"
	echo "  ro       zbasu ro da"
	echo "  gboard   zbasu lo se pilno be la'o zoi Gboard zoi"
	echo "  vimcu    vimcu lo se zbasu"
	echo "  zahurehu za'u re'u zbasu"
	echo "  sidju    jarco lo ti sidju notci"
	echo "  terfarvi jarco lo te farvi datni"

terfarvi:
	echo $(TERFARVI)
