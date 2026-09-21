import pandas as pd

def preprocess_data(df):
    # 删除包含 'unknown' 的样本
    df = df[df['job'] != 'unknown']
    df = df[df['marital'] != 'unknown']

    # 对分类变量进行编码
    df['job'] = df['job'].replace(to_replace=['admin.', 'unemployed', 'management',
                                              'housemaid', 'entrepreneur', 'student', 'blue-collar',
                                              'self-employed', 'retired', 'technician', 'services'],
                                  value=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    df['marital'] = df['marital'].replace(to_replace=['married', 'single', 'divorced'], value=[0, 1, 2])
    df['education'] = df['education'].replace(to_replace=["unknown", "illiterate", "basic.4y", "basic.6y", "basic.9y",
                                                           "high.school", "professional.course", "university.degree"],
                                              value=[0, 1, 2, 3, 4, 5, 6, 7])
    df['default'] = df['default'].replace(to_replace=['no', 'yes', 'unknown'], value=[0, 1, 2])
    df['housing'] = df['housing'].replace(to_replace=['no', 'yes', 'unknown'], value=[0, 1, 2])
    df['loan'] = df['loan'].replace(to_replace=['no', 'yes', 'unknown'], value=[0, 1, 2])
    df['contact'] = df['contact'].replace(to_replace=['cellular', 'unknown', 'telephone'], value=[0, 1, 2])
    df['day_of_week'] = df['day_of_week'].replace(to_replace=['mon', 'tue', 'wed', 'thu', 'fri'], value=[0, 1, 2, 3, 4])
    df['poutcome'] = df['contact'].replace(to_replace=['unknown', 'failure', 'nonexistent', 'success'],
                                           value=[0, 1, 2, 3])
    df['month'] = df['month'].replace(to_replace=['jan', 'feb', 'mar', 'apr', 'may', 'jun',
                                                   'jul', 'aug', 'sep', 'oct', 'nov', 'dec'],
                                       value=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    df['y'] = df['y'].replace(to_replace=['no', 'yes'], value=[0, 1])
    

    return df

if __name__ == "__main__":
    # 读取数据
    df = pd.read_csv('../data/bank-additional-full.csv', sep=';')
    for i in df.columns:
        if type(df[i][0]) is str:
            unknown_count = df[df[i]=='unknown']['y'].count()
            print("unknown value count in "+i+":\t"+str(unknown_count))
    
    # # 打印原始数据信息
    # print("原始数据信息：")
    # print(df.info())
    
    # 数据预处理
    df_processed = preprocess_data(df)
    
    # 打印预处理后的数据信息
    # print("\n预处理后的数据信息：")
    # print(df_processed.info())
