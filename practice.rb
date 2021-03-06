require 'byebug'

require 'mixlib/cli'
class MyCLI
  include Mixlib::CLI


  option :arg_not_required,
         description: "This takes no argument.",
         long: "--arg-not-required",
         short: "-n"

  option :arg_required,
         description: "This takes an argument.",
         long: "--arg-required ARG",
         short: "-a",
         in: ["a", "b", "c"]

  deprecated_option :dep_one,
                    short: "-1",
                    long: "--dep-one",
                    # this deprecated option maps to the '--arg-not-required' option:
                    replacement: :arg_not_required,
                    # Do not keep 'dep_one' in `config` after parsing.
                    keep: false

  deprecated_option :dep_two,
                    short: "-2",
                    long: "--dep-two ARG",
                    replacement: :arg_required,
                    # will map the  given value to a valid value for `--arg-required`.
                    value_mapper: Proc.new { |arg|
                      case arg
                      when "q"; "invalid" # We'll use this to show validation still works
                      when "z"; "a"
                      when "x"; "b"
                      else
                        "c"
                      end
                    }

  end
