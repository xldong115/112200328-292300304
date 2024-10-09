import hashlib

def md5(string):
    """
    :param string: 传递的参数，想要加密的数据
    :return:
    """
    hash_object = hashlib.md5('可以修改的字符串'.encode('utf-8'))
    hash_object.update(string.encode('utf-8'))
    return hash_object.hexdigest()


if __name__ == '__main__':
    res = md5("123456")
    print(res)
