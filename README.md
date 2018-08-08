# CouenneBuilder

[![Build Status](https://travis-ci.org/jgoldfar/CouenneBuilder.svg?branch=master)](https://travis-ci.org/jgoldfar/CouenneBuilder)

This is an example repository showing how to construct a "builder" repository for a binary dependency.  Using a combination of [`BinaryBuilder.jl`](https://github.com/staticfloat/BinaryBuilder.jl), [Travis](https://travis-ci.org), and [GitHub releases](https://docs.travis-ci.com/user/deployment/releases/), we are able to create a fully-automated, github-hosted binary building and serving infrastructure.

We will be building binaries for

    https://www.coin-or.org/download/source/Couenne/Couenne-0.5.6.tgz
