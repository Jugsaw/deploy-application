using Pkg

cd(get(ENV, "INPUT_DIR", "."))

Pkg.activate(".")
Pkg.instantiate()

include(joinpath(pwd(), "app.jl")) # ??? without joinpath, `app.jl` is resolved to `/app.jl`

using Jugsaw.Template: docker_config
using JugsawIR: julia2ir

dockerfile = docker_config(; juliaversion=VERSION)
demos, types = julia2ir(Jugsaw.APP)
readme = isfile("README.md") ? read("README.md", String) : ""

# outputs
DEMOS = "demos"
TYPES = "types"
README = "readme"
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
    println(
        io,
        """
        $README<<$delimiter
        $readme
        $delimiter
        """
    )
    println(io, "$DEMOS=$demos")
    println(io, "$TYPES=$types")
end
