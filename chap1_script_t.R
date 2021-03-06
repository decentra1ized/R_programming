#실행1_4
# 숫자함수의 사용
x <- c(1, 2, 3)
x
mean(x)
max(x)
min(x)
# 문자함수의 사용
paste(str5, collapse = ",") # 쉼표를 구분자로 str4 의 단어들 하나로 합치기
paste(str5, collapse = " ")
# 함수를 이용한 새로운 변수 생성
x_mean <- mean(x)
x_mean
str5_paste <- paste(str5, collapse = " ")
str5_paste

#-------------------------------------------------------------------------------

#실행1_5
#패키지 설치하기, 로드하기
#install.packages("ggplot2") # ggplot2 패키지 설치
library(ggplot2) # ggplot2 패키지 로드

# 패키지함수 사용하기
x <- c("a", "a", "b", "c")
# 빈도 그래프 출력
qplot(x)

# ggplot2의 mpg 데이터로 그래프 만들기
# data 에 mpg, x 축에 hwy 변수 지정하여 그래프 생성
mpg
qplot(data = mpg, x = hwy) 

# qplot() 파라미터 바꿔보기
# x 축 cty
qplot(data = mpg, x = cty)

# x 축 drv, y 축 hwy
qplot(data = mpg, x = drv, y = hwy)

# x 축 drv, y 축 hwy, 상자 그림 형태
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")

# x 축 drv, y 축 hwy, 상자 그림 형태, drv 별 색 표현
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)

# 함수의 기능이 궁금할 땐 Help 함수
?qplot

#-------------------------------------------------------------------------------

#연습1-1
#1-1-1
score <- c(80, 60, 70, 50, 90)
score

#1-1-2
mean(score)

#1-1-3
mean_score <- mean(score)
mean_score

#-------------------------------------------------------------------------------

#실행1_6
# 데이터 프레임 만들기
english <- c(90, 80, 60, 70) # 영어 점수 변수 생성
english
math <- c(50, 60, 100, 20) # 수학 점수 변수 생성
math
# english, math 로 데이터 프레임 생성해서 df_midterm 에 할당
df_midterm <- data.frame(english, math)
df_midterm
class <- c(1, 1, 2, 2)
class
df_midterm <- data.frame(english, math, class)
df_midterm
mean(df_midterm$english) # df_midterm 의 english 로 평균 산출
mean(df_midterm$math) # df_midterm 의 math 로 평균 산술
# 데이터 프레임 한 번에 만들기
df_midterm_2 <- data.frame(english = c(90, 80, 60, 70),
                           math = c(50, 60, 100, 20),
                           class = c(1, 1, 2, 2))
df_midterm_2

#-------------------------------------------------------------------------------

#연습1-2
#1-2-1
df_sales <- data.frame(fruit = c("사과", "딸기", "수박"),
                       price = c(1800, 1500, 3000),
                       volume = c(24, 38, 13))

#1-2-2
mean(df_sales$price) # 과일 가격 평균
mean(df_sales$volume) # 판매량 평균


#-------------------------------------------------------------------------------

#실행1_7
# 엑셀 파일 불러오기
# readxl 패키지 설치 및 로드
#install.packages("readxl")
library(readxl)
# 엑셀파일 불러오기 (경로 지정 필요)
df_exam <- read_excel("C:/R_programming/chap1_excel_data.xlsx")
df_exam
mean(df_exam$mid)
mean(df_exam$final)
# 엑셀 파일에 시트가 여러 개인 경우
df_exam_2 <- read_excel("C:/R_programming/chap1_excel_data.xlsx", sheet = 3)
df_exam_2
# 엑셀 파일 첫 번째 행이 변수명이 아닌경우
df_exam_3 <- read_excel("C:/R_programming/chap1_excel_data.xlsx", col_names = F,
                        sheet = 2)
df_exam_3

#-------------------------------------------------------------------------------

#실행1_8
# csv 파일 불러오기
df_exam_csv <- read.csv("C:/R_programming/chap1_csv_data.csv")
# Mac 한글data 오류 시 read.csv("chap1_csv_data.csv",fileEncoding = "euc-kr")로 수정
# 데이터 프레임을 CSV 파일로 저장하기
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm
write.csv(df_midterm, file = "df_midterm.csv")
write.csv(df_midterm, file = "C:/R_programming/df_midterm.csv")

#-------------------------------------------------------------------------------

#실행1_9
# RData 파일 활용하기
# 데이터 프레임을 RData 파일로 저장하기 (프레임명까지 저장됨)
save(df_midterm, file = "test_df_midterm.rda")
# RData 불러오기
load("test_df_midterm.rda")
df_midterm

#-------------------------------------------------------------------------------
#연습1-3
#1-3-1
df_ex3_sheet1 <- read_excel("chap1_ex3_data.xlsx", sheet = 1)
df_ex3_sheet1
df_ex3_sheet2 <- read_excel("chap1_ex3_data.xlsx", sheet = 2)
df_ex3_sheet2

#1-3-2
write.csv(df_ex3_sheet1, file = "df_ex3_sheet1.csv")
save(df_ex3_sheet2, file = "df_ex3_sheet2.rda")
