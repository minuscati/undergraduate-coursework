import pandas as pd
from sklearn import preprocessing
from sklearn.utils import shuffle
from collections import Counter

def standard_num_attrs(data, numeric_attrs):
    for i in numeric_attrs:
        std = data[i].std()
        if std != 0:
            data[i] = (data[i]-data[i].mean()) / std
        else:
            data = data.drop(i, axis=1)
    return data

# def trans_num_attrs(data, numeric_attrs):
#     bining_num = 10
#     bining_attr = 'age'
#     data[bining_attr] = pd.qcut(data[bining_attr], bining_num)
#     data[bining_attr] = pd.factorize(data[bining_attr])[0]+1
    
#     for i in numeric_attrs: 
#         scaler = preprocessing.StandardScaler()
#         data[i] = scaler.fit_transform(data[i])
#     return data

def onehot_cate_attrs(data, cate_attrs):
    for i in cate_attrs:
        dummies_df = pd.get_dummies(data[i])
        dummies_df = dummies_df.rename(columns=lambda x: i+'_'+str(x))
        data = pd.concat([data, dummies_df], axis=1)
        data = data.drop(i, axis=1)
    return data

def preprocess_data(df):
    
    # 删除包含 'unknown' 的样本
    df = df[df['job'] != 'unknown']
    df = df[df['marital'] != 'unknown']
    df = df[df['housing'] != 'unknown']
    df = df[df['loan'] != 'unknown']

    df['default'] = df['default'].replace(to_replace=['no', 'yes', 'unknown'], value=[0, 1, 2])
    df['housing'] = df['housing'].replace(to_replace=['no', 'yes', 'unknown'], value=[0, 1, 2])
    df['loan'] = df['loan'].replace(to_replace=['no', 'yes', 'unknown'], value=[0, 1, 2])
    df['education'] = df['education'].replace(to_replace=["unknown", "illiterate", "basic.4y", "basic.6y", "basic.9y",
                                                           "high.school", "professional.course", "university.degree"],
                                              value=[0, 1, 2, 3, 4, 5, 6, 7])
    df['y'] = df['y'].replace(to_replace=['no', 'yes'], value=[0, 1])
    
    numeric_attrs = ['age', 'duration', 'campaign', 'pdays', 'previous',
                     'emp.var.rate', 'cons.price.idx', 'cons.conf.idx',
                     'euribor3m', 'nr.employed']
    bin_attrs = ['default', 'housing', 'loan']
    cate_attrs = ['job', 'marital', 'contact', 'month', 'day_of_week', 'poutcome']
    df= standard_num_attrs(df,numeric_attrs)
    df = onehot_cate_attrs(df, cate_attrs)
    df = shuffle(df)
    return df



if __name__ == "__main__":
    # 读取数据
    df = pd.read_csv('../data/bank-additional-full.csv', sep=';')
    df.to_csv('spilit.csv',index=False)
    # 数据预处理
    df_processed = preprocess_data(df)
    
    # 打印预处理后的数据信息
    print(df_processed)
    # df_processed.to_csv('processed_data.csv', index=False)
    

