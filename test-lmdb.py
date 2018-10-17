import lmdb

env = lmdb.open('test.db', subdir=False)

with env.begin(write=True) as txn:

    txn.put('str', 'testing')

    arr = bytearray(10)
    arr[0] = 1
    arr[1] = 2
    arr[2] = 3
    arr[-3] = 7
    arr[-2] = 8
    arr[-1] = 9
    txn.put('arr', arr)

with env.begin() as txn:

    value = txn.get('str')
    assert value == 'testing'

    value = txn.get('arr')
    assert len(value) == 10
    assert ord(value[0]) == 1
    assert ord(value[-1]) == 9

env.close()

print 'OK'
