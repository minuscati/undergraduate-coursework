from sklearn.linear_model import LogisticRegression
from pandas import read_csv
import pandas as pd
import math
from sklearn import  metrics as mt
import numpy as np
import matplotlib.pyplot as plt

#重采样
def resample_train_data(df, n):
    split = int(n*0.8)
    train_data_original = df[:split]
    test_data = df[split:]
    test_data_X = (test_data.drop('y',axis=1)).values.tolist() # 自变量
    test_data_y = (test_data['y']).values.tolist() # 因变量
    pos_data = df[df['y'] == 1]
    pos_train_data = train_data_original[train_data_original['y'] == 1]
    new_count = train_data_original.shape[0]-2*pos_train_data.shape[0]  #缺失的正样本数
    m = math.ceil(new_count/(pos_data.shape[0])) #正样本重复次数
    pos_depeated=pd.concat([pos_data] * m, ignore_index=True)
    train_data = pd.concat([train_data_original, pos_depeated.sample(new_count)])
    train_data_X=(train_data.drop('y',axis=1)).values.tolist()
    train_data_y=(train_data['y']).values.tolist()
    return train_data_X,train_data_y,test_data_X,test_data_y


# 函数说明:使用Sklearn构建Logistic回归分类器
def colicSklearn():
    df = read_csv("期中大作业A/processed_data2.csv")
    labels = df.columns.tolist()    #分类属性
    #dataSet=df.values.tolist()
    del labels[-1]                  #返回数据集和分类属性
    n = 40787                
    train_data_X,train_data_y,test_data_X,test_data_y=resample_train_data(df,n)
    classifier = LogisticRegression(solver='liblinear',max_iter=80).fit(train_data_X, train_data_y)
    predictY = classifier.predict(test_data_X)  # 预测值
    # 利用混淆矩阵来评估模型好坏
    acu = mt.accuracy_score(test_data_y,predictY)
    sen = mt.recall_score(test_data_y,predictY)
    print('accuracy score：%.2f%%' % (acu * 100))
    print('recall score：%.2f%%' % (sen * 100))
    coef = classifier.coef_  # 回归系数
    sorted_indices = np.argsort(abs(coef)).tolist()[0]
    sorted_feature=[labels[i-1] for i in sorted_indices]
    print(coef)
    print(sorted_feature)

if __name__ == '__main__':
    colicSklearn()
    """
    df = read_csv("期中大作业A/processed_data2.csv")
    n = 40787
    S=[]
    for i in range(20):
        train_data_X,train_data_y,test_data_X,test_data_y=resample_train_data(df,n)
        counter=10+10*i
        classifier = LogisticRegression(solver='liblinear',max_iter=counter).fit(train_data_X, train_data_y)
        predictY = classifier.predict(test_data_X)  # 预测值
        sen = mt.recall_score(test_data_y,predictY)*100
        S.append(sen)
    plt.rc('font',family='SimHei') #绘图时显示中文字体
    x=np.arange(20)*10+10
    plt.plot(x,S)
    plt.title('召回率随迭代次数的变化曲线')
    plt.xlabel('迭代次数')
    plt.ylabel('召回率')
    plt.show()
    """