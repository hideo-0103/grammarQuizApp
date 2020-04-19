# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

languages = ["ABAP","ActionScript","Apache","API Blueprint","AppleScript","Awk","BIML","1C (BSL)","C","Ceylon","CFScript","Clojure","CMake","CoffeeScript","Common Lisp","Config File","Console","Coq","C++","Crystal","C#","CSS","D","Dart","diff","digdag","Docker","DOT","Eiffel","Elixir","Elm","ERB","Erlang","Factor","Fortran","FSharp","Gherkin","GLSL","Go","Gradle","Graphql","Groovy","Hack","Haml","Handlebars","Haskell","HTML","HTTP","HyLang","IDL","IgorPro","INI","Io","Irb","Irb_output","Java","JavaScript","Jinja","JSON","Json-doc","Jsonnet","JSX","Julia","Kotlin","Lasso","Liquid","Literate CoffeeScript","Literate Haskell","LLVM","Lua","Make","Markdown","MATLAB","MoonScript","Mosel","MXML","Nasm","nginx","Nim","Nix","Objective-C","OCaml","Pascal","Perl","PHP","Plain Text","Plist","Pony","powershell","Praat","Prolog","Prometheus",".properties","Protobuf","Puppet","Python","Q","QML","R","Racket","Ruby","Rust","Sass","Scala","Scheme","SCSS","sed","shell","Sieve","Slim","Smalltalk","Smarty","SML","SQL","Swift","TAP","Tcl","TeX","TOML","TypeScript","Tulip","Turtle/TriG","Twig","Vala","Visual Basic","Verilog and System Verilog","VHDL 2008","VimL","Vue","Wollok","XML","YAML","HTML&CSS"]

languages.each do |language|
  Language.create(:language => language)
end