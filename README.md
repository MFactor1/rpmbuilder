# rpmbuilder
Generalized RPM builder for my projects.

## Setup
- Requires script `<repo dir>/compile` that compiles your code and puts it in `<repo dir>/build/src`.
- Requires License file at `<repo dir>/LICENSE`
- Requires Version file at `<repo dir>/VERSION`
- Requires RPM build `.spec` file at `<repo dir>/pkg/rpm/<name>.spec` (The repo name must be the same as `<name>` and also the `Name: <name>` listed in the spec file.)

## Usage
Clone this repo, and `cd` into it.
Then run
```
./rpmbuild.sh <dir to your repo>
```
For example:
```
./rpmbuild.sh /home/mfactor/gitrepos/test-repo
```
