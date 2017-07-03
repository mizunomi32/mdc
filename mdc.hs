-- -----------------------------
--  mdc (MakeDown Compiler)
-- (c) mizunomi 2017 
-- ----------------------------

-- TODO:パーサー作る
-- TODO:構文解析(とりあえずH1と改行)

import System.Environment (getArgs)
import System.IO
import System.FilePath.Posix

main = do
     a <- getArgs
     let filename =  a !! 0
         name = takeBaseName filename
         outfile = name ++ ".html"
     print filename
     print name
     print outfile
--     h <- openFile filename ReadMode
--     read_and_disp h
--     hClose h
     headerbuilder outfile name 
     footerbuilder outfile
     
-- <h1>タグ (行先頭が"# "の時)
h1builder filename msg = do
      appendFile filename "<h1>"
      appendFile filename msg
      appendFile filename "</h1>\n"
-- <br>タグ(行末が半角スペース２個の時)
brbuilder filename = do
      appendFile filename "<br>\n"

-- ヘッター作るやつ
headerbuilder filename name = do
      writeFile filename "<html>\n<head>\n<title>"
      appendFile filename name
      appendFile filename "</title>\n</head>\n<body>\n"
-- フッター作るやつ
footerbuilder filename = do
      print "(at footerbuilder)"
      appendFile filename "</body>"
      appendFile filename "</html>"
syntaxchecker str = do
      print "(at syntaxchecker)"
      ["a","a"]
nextparser s
read_and_disp h =
       do iseof <- hIsEOF h
          if iseof == True then return ()
          else do str <- hGetLine h
                  putStrLn str
                  read_and_disp h