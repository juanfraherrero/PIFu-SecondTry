import argparse

def testPRT(dir_path, n=40):
    if dir_path[-1] == '/':
        dir_path = dir_path[:-1]
    sub_name = dir_path.split('/')[-1][:-4]
    obj_path = os.path.join(dir_path, sub_name + '_100k.obj')
    os.makedirs(os.path.join(dir_path, 'bounce'), exist_ok=True)

    PRT, F = computePRT(obj_path, n, 2)
    np.savetxt(os.path.join(dir_path, 'bounce', 'bounce0.txt'), PRT, fmt='%.8f')
    np.save(os.path.join(dir_path, 'bounce', 'face.npy'), F)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-i', '--input', type=str, default='/Downloads/rp_dennis_posed_004_OBJ')
    parser.add_argument('-n', '--n_sample', type=int, default=40, help='squared root of number of sampling. the higher, the more accurate, but slower')
    args = parser.parse_args()

    testPRT(args.input)