import operator as op
from itertools import product


def op_div(x, y):
    return x // y if y != 0 else 0


def lut(temp: str, f: callable, name: str):
    digits = product(range(10), repeat=2)
    beginning = f"""
module {name} (dig1, dig2, res);
  input [3:0] dig1, dig2;
  output [3:0] res;
  assign res = """

    middle = "\n".join(temp.format(x, y, f(x, y) % 10)
                       for x, y in digits
                       )
    ending = "0;\nendmodule"
    with open(name + ".v", "w") as file:
        file.write(beginning)
        file.write(middle)
        file.write(ending)


if __name__ == '__main__':
    template = "(dig1 == 4'd{} && dig2 == 4'd{}) ? 4'd{} :"
    calc_ops = (op.add, op.sub, op.mul, op_div)
    calc_names = ("add", "sub", "mul", "div")
    for f, n in zip(calc_ops, calc_names):
        lut(template, f, n)
