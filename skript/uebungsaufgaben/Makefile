#
# Makefile -- build images for exercises
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
.PHONY:	all images exercise path 601 602 603

all:

images:	exercise path 601 602 603

exercise_FILES = exercise-1.pdf
exercise: $(exercise_FILES)

$(exercise_FILES):	exercise.mp
	TEX=latex mpost exercise.mp
	for i in 1; \
	do \
		mptopdf exercise.$${i}; \
	done

path_FILES = path-1.pdf
path: $(path_FILES)

$(path_FILES):	path.mp
	TEX=latex mpost path.mp
	for i in 1; \
	do \
		mptopdf path.$${i}; \
	done

601_FILES = 601-1.pdf
601:	$(601_FILES)
$(601_FILES):	601.mp
	TEX=latex mpost 601.mp
	for i in 1; \
	do \
		mptopdf 601.$${i}; \
	done

602_FILES = 602-1.pdf
602:	$(602_FILES)
$(602_FILES):	602.mp
	TEX=latex mpost 602.mp
	for i in 1; \
	do \
		mptopdf 602.$${i}; \
	done

603_FILES = 603-1.pdf
603:	$(603_FILES)
$(603_FILES):	603.mp
	TEX=latex mpost 603.mp
	for i in 1; \
	do \
		mptopdf 603.$${i}; \
	done

clean:
	rm -f *.log *.pdf *.mpx *.[0-9]
