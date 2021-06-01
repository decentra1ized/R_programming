#실행1_2
#변수만들기
a <- 1
a
b <- 2
b
c <- 3
c
d <- 3.5
d
a+b
a+b+c
4/b
5*b

# 여러 값으로 구성된 변수 만들기
# c()
var1 <- c(1, 2, 5, 7, 8) # 숫자 다섯 개로 구성된 var1 생성
var1
var2 <- c(1:5) # 1~5 까지 연속값으로 var2 생성
var2
# seq()
var3 <- seq(1, 5) # 1~5 까지 연속값으로 var3 생성
var3
var4 <- seq(1, 10, by = 2) # 1~10 까지 2 간격 연속값으로 var4 생성
var4
var5 <- seq(1, 10, by = 3) # 1~10 까지 3 간격 연속값으로 var5 생성
var5

# 숫자변수로 연산하기
var1
var1+2
var1
var2
var1+var2
  
#-------------------------------------------------------------------------------

#실행1_3
# 문자로 된 변수 만들기
str1 <- "a"
str1
str2 <- "text"
str2
str3 <- "Hello World!"
str3

# 연속 문자 변수 만들기
str4 <- c("a", "b", "c")
str4
str5 <- c("Hello!", "World", "is", "good!")
str5
# 문자 변수는 연산 불가
str1+2


#-------------------------------------------------------------------------------


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


#-------------------------------------------------------------------------------

#실행2_1
# 데이터 준비
exam <- read.csv("chap2_csv_data.csv")
# 데이터 파악하기
head(exam, 10) # 앞에서부터 10 행까지 출력, 지정안하면 6행까지
tail(exam, 10) # 앞에서부터 10 행까지 출력, 지정안하면 6행까지
dim(exam) # 행, 열 출력
str(exam) # 데이터 속성 확인
summary(exam) # 요약통계량 출력


#-------------------------------------------------------------------------------


#연습2-1
library(ggplot2) #패키지 로드
mpg <- as.data.frame(ggplot2::mpg)

head(mpg)
tail(mpg)
dim(mpg)
str(mpg)
summary(mpg)


#-------------------------------------------------------------------------------


#실행2_2
# dplyr 패키지 설치와 로드 & 데이터 준비
# install.packages("dplyr")
library(dplyr)
exam <- read.csv("chap2_csv_data.csv")
# exam 에서 class 가 1 인 경우만 추출하여 출력
exam %>% filter(class == 1)
# 단축키 [Ctrl+Shit+M]으로 %>% 기호 입력
# 1 반이 아닌 경우
exam %>% filter(class != 1)
# 초과, 미만, 이상, 이하 조건 걸기
# 수학 점수가 50 점을 초과한 경우
exam %>% filter(math > 50)
# 1 반 이면서 수학 점수가 50 점 이상인 경우
exam %>% filter(class == 1 & math >= 50)
# 수학 점수가 90 점 이상이거나 영어점수가 90 점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)
# 목록에 해당되는 행 추출하기
exam %>% filter(class == 1 | class == 3 | class == 5) # 1, 3, 5 반에 해당되면 추출
exam %>% filter(class %in% c(1,3,5)) # 1, 3, 5 반에 해당하면 추출, %in% 기호 이용
# 추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class == 1) # class 가 1 인 행 추출, class1 에 할당
class2 <- exam %>% filter(class == 2) # class 가 2 인 행 추출, class2 에 할당
mean(class1$math) # 1 반 수학 점수 평균 구하기
mean(class2$math) # 2 반 수학 점수 평균 구하기


#-------------------------------------------------------------------------------


#연습2_2
#2-2-1
mpg <- as.data.frame(ggplot2::mpg)

mpg_a <- mpg %>% filter(displ <= 4) #displ 4 이하 추출
mpg_b <- mpg %>% filter(displ >= 5) #displ 5 이상 추출
mean(mpg_a$hwy) #displ 4 이하 hwy 평균
mean(mpg_b$hwy) #displ 5 이상 hwy 평균

#2-2-2
mpg_audi <- mpg %>% filter(manufacturer == "audi") # audi 추출
mpg_toyota <- mpg %>% filter(manufacturer == "toyota") #toyota 추출
mean(mpg_audi$cty) # audi의 cty 평균
mean(mpg_toyota$cty) # toyota의 cty 평균

#2-2-3
#manufacturer가 chevrolet, ford, honda에 해당하면 추출
mpg_new <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_new$hwy)


#-------------------------------------------------------------------------------


#실행2_3
# 필요한 변수만 추출하기
exam %>% select(math) # math 추출
exam %>% select(class, math, english) # class, math, english 변수 추출
exam %>% select(-math) # math 제외
exam %>% select(-math, -english) # math, english 제외
# dplyr 함수 조합하기
# class 가 1 인 행만 추출한 다음 english 추출
exam %>% filter(class == 1) %>% select(english)


#-------------------------------------------------------------------------------


#연습2_3
#2-3-1
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기

df <-mpg %>% select(class, cty) # class, cty 추출
head(df)

#2-3-2
df_suv <- df %>% filter(class == "suv") #class가 suv인 행 추출
df_compact <- df %>% filter(class == "compact") #class가 compact인 행 추출
mean(df_suv$cty) # suv의 cty 평균
mean(df_compact$cty) #compact의 cty 평균


#-------------------------------------------------------------------------------


#실행2_4
# 그룹별로 요약하기
exam %>% summarise(mean_math = mean(math)) # math 평균 산출
exam %>%
  group_by(class) %>% # class 별로 분리
  summarise(mean_math = mean(math)) # math 평균 산출
# 여러 요약통계량 한 번에 산출하기
exam %>%
  group_by(class) %>% # class 별로 분리
  summarise(mean_math = mean(math), # math 평균
            sum_math = sum(math), # math 합계
            median_math = median(math), # math 중앙값
            n = n()) # 학생 수
# 여러개의 그룹변수 사용하기
mpg %>%
  group_by(manufacturer, drv) %>% # 회사별, 구방방식별 분리
  summarise(mean_cty = mean(cty)) %>% # cty 평균 산출
  head(10) # 일부 출력


#-------------------------------------------------------------------------------


#실행2_5
# 순서대로 정렬하기
exam %>% arrange(math) # math 오름차순 정렬
exam %>% arrange(desc(math)) # math 내림차순 정렬


#-------------------------------------------------------------------------------


#연습2_4
#2-4-1
##library(dplyr)
##mpg <-  as.data.frame(ggplot2::mpg) #mpg 데이터 불러오기
mpg %>%
  group_by(class) %>% #class별 분리
  summarise(mean_cty = mean(cty)) # cty 평균 구하기

#2-4-2
mpg %>%
  group_by(class) %>% #class별 분리
  summarise(mean_city = mean(cty))  %>% # cty 평균 구하기
  arrange(desc(mean_cty)) #내림차순 정의하기
  
#2-4-3
mpg %>%
  group_by(class) %>% #class별 분리
  summarise(mean_hwy = mean(hwy))  %>% # cty 평균 구하기
  arrange(desc(mean_hwy))  %>%#내림차순 정의하기
  head(3) #상위 3행 출력
  
#2-4-4
mpg %>%
  filter(class == "compact")  %>%
  group_by(manufacturer) %>% #class별 분리
  summarise(count = n())  %>% # cty 평균 구하기
  arrange(desc(count)) #내림차순 정의하기
  
  
#-------------------------------------------------------------------------------


#실행2_6
#변수 추가하기
exam %>%
  mutate(total = math + english + science) # 총합 변수 추가
#여러개 변수 추가하기
exam %>%
  mutate(total = math + english + science, # 총합 변수 추가
         mean = (math + english + science)/3) # 총평균 변수 추가
#조건문으로 변수 추가하기
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail"))
exam %>%
  mutate(test = ifelse(science >= 90, "A", ifelse(science >= 60, "B", "C")))
#변수를 추가한 데이터 만들기
exam2 <- exam %>%
  mutate(test = ifelse(science >= 90, "A", ifelse(science >= 60, "B", "C")),
         mean = (math + english + science)/3)
exam2


#-------------------------------------------------------------------------------


#연습2_5
#2-5-1
mpg_add <- mpg %>%
  mutate(total = cty + hwy, #합산 변수 만들기
        mean = total/2) %>% #평균 변수 만들기
  arrange(desc(mean))
  
#2-5-2
mean(mpg_add$mean)

mpg_add <- mpg_add %>%
  mutate(group = ifelse(mean >= 20.14957, "H", "L"))

table(mpg_add$group)

