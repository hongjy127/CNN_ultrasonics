from data_process import *

if __name__ == "__main__":
    config = Configuration()
    data = load(config.fname)
    signals = scaling(data[0])