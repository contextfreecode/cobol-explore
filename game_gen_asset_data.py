import pathlib as pth
import typing as typ


def gen(path: pth.Path):
    data = path.read_bytes()
    name = path.stem
    # print(name, len(data))
    with open(f"game-asset-{name}.cpy", "w") as output:
        gen_text(data=data, name=name, output=output)


def gen_text(*, data: bytes, name: str, output: typ.TextIO):
    size = len(data)
    indent = " " * 11
    output.write(f"{indent}78 {name}-asset-data-size value {size}.\n")
    output.write(f"{indent}01 {name}-asset-data pic x({size}) value\n")
    more_indent = indent + " " * 4
    chunk_size = (72 - len(more_indent) - 5) // 2
    for index in range(0, size, chunk_size):
        chunk = data[index : index + chunk_size].hex()
        follow = " &" if index + chunk_size < size else "."
        output.write(f'{more_indent}x"{chunk}"{follow}\n')


def main():
    for kid in pth.Path("assets").iterdir():
        if kid.suffix == ".png":
            gen(kid)


main()
