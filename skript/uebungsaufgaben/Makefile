#
# Makefile -- build images for exercises
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	exercise path

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

