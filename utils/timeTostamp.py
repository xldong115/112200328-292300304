import time

def time_to_stamp(old_time):
    # 先转换为时间数组
    timeArray = time.strptime(old_time, "%Y-%m-%d %H:%M:%S")
    print(timeArray)

    # 转换为时间戳
    timeStamp = float(time.mktime(timeArray))
    # print(timeStamp)
    return timeStamp

# if __name__ == '__main__':
#     time_to_stamp("2019-5-10 23:40:00")
