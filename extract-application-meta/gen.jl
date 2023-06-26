using Pkg

cd(get(ENV, "INPUT_DIR", "."))

Pkg.activate(".")
Pkg.instantiate()

include("./app.jl")

using Jugsaw.Template: docker_config

demos, types = JugsawIR.julia2ir(app)
demos, types = escape_string(demos), escape_string(types)

dockerfile = docker_config(; juliaversion=VERSION)

# outputs
DEMOS = "demos"
TYPES = "types"
DOCKERFILE = "dockerfile"

# https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#multiline-strings
using Random: randstring
open(ENV["GITHUB_OUTPUT"], "a") do io
    delimiter = randstring()
    println(
        io,
        """
        $DOCKERFILE<<$delimiter
        $dockerfile
        $delimiter
        """
    )
    println(io, "$DEMOS=$demos")
    println(io, "$TYPES=$types")
end
