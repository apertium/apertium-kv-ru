hash aq-regtest 2>&- || { echo >&2 "I require 'aq-regtest' but it's not installed.  Please install apertium-quality."; exit 1; }

aq-regtest -d . kv-ru http://wiki.apertium.org/wiki/Special:Export/Komi_and_Russian/Pending_tests
