# cargo.sh --- configure the rust cargo setup

RUST_SRC_PATH="${HOME}/src/rust/src"
[ -d "${RUST_SRC_PATH}" ] && export RUST_SRC_PATH

CARGO_BIN="${HOME}/.cargo/bin"
[ -d "${CARGO_BIN}" ] && pathprepend "${CARGO_BIN}"
