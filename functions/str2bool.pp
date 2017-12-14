# Dummy helper that mimics str2bool but in a
# less clever way...
function eosserver::str2bool(Variant[String, Undef] $input) >> Boolean {
  case $input {
    Undef: { false }
    String: {
      case $input {
        /^\w+/: { true }
        default: { false }
      }
    }
    default: { }
  }
}
