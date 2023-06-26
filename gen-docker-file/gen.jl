using Pkg

Pkg.activate(".")
Pkg.instantiate()

# include("app.jl")

# using Jugsaw.Template: docker_config

# demos, types = JugsawIR.julia2ir(app)
# dockerfile_base = docker_config(; juliaversion=VERSION)

# # TODO: Inject README file

# dockerfile = """
# $dockerfile_base

# LABEL jugsaw.demos = "$escape_string(demos)"
# LABEL jugsaw.types = "$escape_string(types)"
# """

dockerfile = """
FROM julia:1
LABEL foo=bar
"""

# https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#multiline-strings
using Random: randstring
open(ENV["GITHUB_OUTPUT"], "a") do io
    delimiter = randstring()
    println(
        io,
        """
        dockerfile<<$delimiter
        $dockerfile
        $delimiter
        """
    )
end
