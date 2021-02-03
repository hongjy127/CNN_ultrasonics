import numpy as np
import matplotlib.pyplot as plt
from pyts.image import RecurrencePlot

# 설정 정보 불러오기
class Configuration:
    def __init__(self):
        config = self.load()
        self.fname = config['FNAME']

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
def load(fname):
    datas = np.loadtxt(fname, delimiter=',', dtype=np.float32)
    signals = datas[:, :-1]
    labels = datas[:, -1].astype('int') 
    data = (signals, labels)
    return data


# scaling
def scaling(signals):
    signals = signals/np.max(np.abs(signals))
    return signals
    
# 이미지로 변환 (memory 문제 - 사용 X)
def sig2img(signals):
    rp = RecurrencePlot(dimension=1, time_delay=1, threshold=None)
    signals.reshape(1,-1)
    img = rp.fit_transform(signals)
    return img

# Cross validation
def CV(signals, labels):
    pass

if __name__ == "__main__":
    # config 확인
    config = Configuration()
    fname = config.fname
    print(fname)

    # load 확인
    data = load(fname)
    print(data[0][-1])
    print(data[1][-1])
    print(data[0].shape, data[1].shape)
    signals = data[0]
    plt.plot(signals[-1,:])

    # scaling 확인
    signals = scaling(signals)
    plt.plot(signals[-1,:])
    plt.show()

    # sig2img 확인
    signal = signals[0:2]
    img = sig2img(signal)
    print(img.shape)
    fig = plt.figure()
    rows = 1
    cols = 2
    ax1 = fig.add_subplot(rows, cols, 1)
    ax1.imshow(img[0])  
    ax2 = fig.add_subplot(rows, cols, 2)
    ax2.imshow(img[1])  
    plt.show()
