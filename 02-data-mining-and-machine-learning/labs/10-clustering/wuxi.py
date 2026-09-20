from numpy import *
import matplotlib
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import kMeans

#计算地球表面两点之间的距离，单位是英里
def distSLC(vecA, vecB):#Spherical Law of Cosines
    a = sin(vecA[0,1]*pi/180) * sin(vecB[0,1]*pi/180)
    b = cos(vecA[0,1]*pi/180) * cos(vecB[0,1]*pi/180) * \
                      cos(pi * (vecB[0,0]-vecA[0,0]) /180)
    return arccos(a + b)*6371.0 #pi is imported with numpy

def lonlat_to_imgxy(lon, lat, img_width, img_height):
    x = img_width * (lon - 120) / (120.7 - 120)
    y = img_height * (31.8 - lat) / (31.8 - 31.38)
    return x, y

def clusterAttractions(numClust=5):
    datList = []
    df = pd.read_excel('data/attractions.xlsx')
    datList = df[['经度', '纬度']].values.tolist()
    datMat = np.mat(datList)
    #这里使用球面距离distSLC作为聚类kMeans.biKmeans中的距离计算方法
    myCentroids, clustAssing = kMeans.biKmeans(datMat, numClust, distMeas=distSLC)

    for i in range(numClust):
        # 找到属于当前簇的所有数据点的索引
        cluster_indices = np.where(clustAssing[:, 0] == i)[0]
        # 输出当前簇的索引以及属于该簇的景点
        print(f"Cluster {i+1}:")
        for idx in cluster_indices:
            print(df.iloc[idx]['景点'])
        print()

    fig = plt.figure()
    rect=[0.1,0.1,0.8,0.8]
    scatterMarkers=['s', 'o', '^', '8', 'p', \
                    'd', 'v', 'h', '>', '<']
    axprops = dict(xticks=[], yticks=[])
    ax0=fig.add_axes(rect, label='ax0', **axprops)
    imgP = plt.imread('data/map3.png')
    ax0.imshow(imgP)
    ax1=fig.add_axes(rect, label='ax1', frameon=False)
    for i in range(numClust):
        ptsInCurrCluster = datMat[nonzero(clustAssing[:,0].A==i)[0],:]
        markerStyle = scatterMarkers[i % len(scatterMarkers)]
        ax1.scatter(ptsInCurrCluster[:,0].flatten().A[0], ptsInCurrCluster[:,1].flatten().A[0], marker=markerStyle, s=90)
    ax1.scatter(myCentroids[:,0].flatten().A[0], myCentroids[:,1].flatten().A[0], marker='+', s=300)
    plt.show()
    print('A')

if __name__ == '__main__':
    clusterAttractions(4)
    
    print('A')
