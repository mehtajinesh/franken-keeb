# Development workflow

## Branch model

```text
main                 Stable, known-good configuration
  `-- dev            Reviewed integration branch
       `-- feature/* One incremental keyboard change
```

Do not develop directly on `dev` or `main`. Use `feature/`, `fix/`, or `docs/`
branches, with one independently testable change per branch.

## Start a change

```sh
git switch dev
git pull --ff-only origin dev
git switch -c feature/<short-description>
```

## Validate locally

```sh
make test
make flash
```

`make test` validates the userspace and compiles the Iris CE keymap. `make
flash` is separate because it changes the physical keyboard.

After flashing, test every affected key. OS-aware changes must be tested after
reconnecting the keyboard to both macOS and Windows. Include Linux or iOS when
the change claims support for those systems.

## Open and review a pull request

```sh
git add <changed-files>
git commit -m "Describe the keyboard change"
git push -u origin feature/<short-description>
gh pr create --base dev --fill
```

Merge only when:

- local QMK validation and compilation succeed;
- the firmware was physically tested;
- CI succeeds;
- the diff has been reviewed; and
- the pull-request checklist is complete.

Delete the feature branch after merging. Promote an integrated, physically
tested `dev` state to `main` through a separate pull request.

## Repository settings

After `dev` is pushed, make it the default branch if routine pull requests
should target it. Protect both `dev` and `main`: require pull requests and the
QMK build status check, disable force pushes, and prevent branch deletion.

CI can compile firmware, but it cannot deploy to the keyboard. Deployment is
the local `make flash` operation.
