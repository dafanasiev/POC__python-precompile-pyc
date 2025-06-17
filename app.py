import time

print("app started")
try:
    from pymodule import hello
    hello.print_hello()
    while True:
        time.sleep(31557600)
except KeyboardInterrupt:
    print("app stopped")
