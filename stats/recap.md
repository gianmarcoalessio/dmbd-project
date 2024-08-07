
# TABELLA RECAP TOTALE

| Query   | Optimization         | Mean Real (s)           | Std Dev Real (s)   | Mean CPU (s)       | Std Dev CPU (s)    | DB_size(GB)         | %extra             |
| ------- | -------------------- | ----------------------- | ------------------ | ------------------ | ------------------ | ------------------- | ------------------ |
| QUERY1A | CLEAN                | 29.655                  | 1.206              | 0.215              | 0.023              | 14.000              | 1.000              |
|         | INDEXED              | 28.640                  | 1.715              | 0.208              | 0.021              | 16.000              | 1.143              |
|         | <mark>MV</mark>      | **<mark>20.403</mark>** | <mark>4.534</mark> | <mark>0.216</mark> | <mark>0.017</mark> | <mark>18.461</mark> | <mark>1.318</mark> |
|         | MV_IDX               | 21.951                  | 4.527              | 0.205              | 0.026              | 19.215              | 1.372              |
| QUERY1B | CLEAN                | 29.253                  | 2.075              | 0.191              | 0.018              | 14.000              | 1.000              |
|         | INDEXED              | 29.270                  | 1.464              | 0.222              | 0.030              | 16.000              | 1.143              |
|         | MV                   | 15.232                  | 1.477              | 0.225              | 0.022              | 18.461              | 1.318              |
|         | ==MV_IDX==           | ==**15.078**==          | ==0.967==          | ==0.222==          | ==0.029==          | ==19.215==          | ==1.372==          |
| QUERY3A | CLEAN                | 9.518                   | 0.415              | 0.059              | 0.012              | 14.000              | 1.000              |
|         | <mark>INDEXED</mark> | **<mark>0.067</mark>**  | <mark>0.022</mark> | <mark>0.050</mark> | <mark>0.004</mark> | <mark>16.000</mark> | <mark>1.143</mark> |
|         | MV                   | 1.984                   | 0.298              | 0.059              | 0.014              | 14.831              | 1.059              |
|         | MV_IDX               | 2.383                   | 0.677              | 0.062              | 0.015              | 14.964              | 1.069              |
| QUERY3B | CLEAN                | 10.126                  | 0.799              | 0.057              | 0.012              | 14.000              | 1.000              |
|         | <mark>INDEXED</mark> | <mark>**0.061**</mark>  | <mark>0.006</mark> | <mark>0.051</mark> | <mark>0.009</mark> | <mark>16.000</mark> | <mark>1.143</mark> |
|         | MV                   | 1.888                   | 0.145              | 0.061              | 0.010              | 14.831              | 1.059              |
|         | MV_IDX               | 2.100                   | 0.231              | 0.058              | 0.013              | 14.964              | 1.069              |

# TABELLE SENZA SLICE

| Query  | Optimization | Mean Real (s) | Std Dev Real (s) | Mean CPU (s) | Std Dev CPU (s) | DB_size(GB) | %extra |
| ------ | ------------ | ------------- | ---------------- | ------------ | --------------- | ----------- | ------ |
| QUERY1 | CLEAN        | 29.454        | 1.641            | 0.203        | 0.021           | 14.000      | 1.000  |
|        | INDEXED      | 28.955        | 1.590            | 0.215        | 0.026           | 16.000      | 1.143  |
|        | MV           | 17.818        | 3.006            | 0.221        | 0.020           | 18.461      | 1.318  |
|        | MV_IDX       | 18.515        | 2.747            | 0.214        | 0.027           | 19.215      | 1.372  |
| QUERY3 | CLEAN        | 9.822         | 0.607            | 0.058        | 0.012           | 14.000      | 1.000  |
|        | INDEXED      | 0.064         | 0.014            | 0.051        | 0.007           | 16.000      | 1.143  |
|        | MV           | 1.936         | 0.222            | 0.060        | 0.012           | 14.831      | 1.059  |
|        | MV_IDX       | 2.242         | 0.454            | 0.060        | 0.014           | 14.964      | 1.069  |
