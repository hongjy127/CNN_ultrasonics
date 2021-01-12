# 으악 이건 matlab으로 다시...
import pickle
import numpy as np
import matplotlib.pyplot as plt

# matlab을 이용해 원래 신호, 노이즈 추가한 신호를 csv로 저장
# 설정 정보 불러오기
class Configuration:
    def __init__(self):
        config = self.load()
        self.fname = config['FNAME']
        self.delimiter = config['DELIMITER']
        self.dtype = config['DTYPE']

    def load(self):
        config = {}
        with open('config.ini','rt') as f:
            entries = f.readlines()
            for entry in entries:
                key, value = entry.split('=')
                config[key.strip()] = value.strip()
        return config

    def __str__(self):
        return f'<Configuration fname {self.fname}>'

# data.csv file 불러오기
class LablingSignal:
    def __init__(self):
        data = self.load()
        self.signals = data[0]
        self.labels = data[1]
    
    def load(self, config):
        data = np.loadtxt(config.name, delimiter=config.delimiter, dtype=config.dtype)
        signals = data[:, :-1]
        labels = data[:, -1].astype('int') 
        return (signals, labels)

# scaling
class Scaling:
    def __init__(self):
        self.scaling_signal = None

    def scaling(self, signals):
        pass
    
# 이미지로 변환

# Cross validation

