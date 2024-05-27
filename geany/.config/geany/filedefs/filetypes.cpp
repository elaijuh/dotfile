[build-menu]
FT_00_LB=_Compile
FT_00_CM=g++-12 -std=c++17 -Wshadow -Wall -o "%e" "%f" -O2 -Wno-unused-result
FT_00_WD=
FT_01_LB=_Build
FT_01_CM=g++-12 -std=c++17 -Wshadow -Wall -o "%e" "%f" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -DLOCAL
FT_01_WD=
