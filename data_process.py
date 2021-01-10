  
import pickle

# Rawdata(.dat파일 - 실험파일) -> pickle로 저장

## .dat 불러오기
def load(fpath):
    with open(fpath,'rt') as f:
        return f.readlines()  # [time amplitude\n, ...]으로 저장됨

## [time amplitude\n, ...] -> [[time, amplitude], ...]
def convert(dataset):
    data = [data.split() for data in dataset]
    time = list(data[i][0] for i in range(len(data)))
    amplitude = list(data[i][1] for i in range(len(data)))
    return (time, amplitude)

def main():
    fpath = 'data/Rawdata/class0/C1#100000.dat'
    dataset = load(fpath)
    time, amplitude = convert(dataset)
    print(time, amplitude)

main()

# 노이즈 추가 -> csv말고 pickle로 저장

# 이미지로 변환