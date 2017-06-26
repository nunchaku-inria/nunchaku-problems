# nunchaku-problems

Set of problems for exercizing Nunchaku, based on "master" branch of Nunchaku.


## How to Run Tests

- install [logitest](https://github.com/nunchaku-inria/logitest):

  ```sh
  $ opam pin add -k git logitest https://github.com/nunchaku-inria/logitest.git
  ```

- run `make` to run everything, or:

  * `make should_pass` for fixed bugs and tests
  * `make bugs` for bugs

