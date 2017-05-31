;;
;; get.el for  in /home/praxy/.emacs.d
;; 
;; Made by AntoineV
;; Login   <praxy>
;; 
;; Started on  Fri May  5 12:02:00 2017 AntoineV
;; Last update Fri May  5 12:49:08 2017 AntoineV
;;

(global-set-key (kdb"C-x a") 'insert-get-next-line)

(defun insert-get-next-line ()
  (interactive)
  (insert (get-next-line))
  )

(defun get-next-line()
  (setq str (read-from-minibuffer
	     (format "Pls pull ENTER ton continue : ")))
  (concat "static char	*_my_gnl_append(char *s1, char *s2)\n"
	  "{\n"
	  "char	*ret;\n"
	  "int	len;\n\n" 
	  "len = my_strlen(s1) + my_strlen(s2);\n"
	  "ret = malloc((len + 1) * sizeof(char));\n"
	  "if (ret == NULL)\n"
	  "return NULL;\n"
	  "if (s1)\n"
	  "ret = my_strcpy(s1, ret);\n"
	  "my_strcpy(s2, ret + my_strlen(s1));\n"
	  "ret[len] = '\0';\n"
	  "if (s1)\n"
	  "free(s1);\n"
	  "return ret;\n"
	  "}\n\n"
	  "char	*my_get_next_line(const int fd)\n"
	  "{\n"
	  "static char	buff[READ_SIZE] = "";\n"
	  "char		*ret;\n"
	  "int		n;\n\n"	  
	  "ret = NULL;\n"
	  "if (buff[0])\n"
	  "ret = _my_gnl_append(NULL, buff);\n"
	  "while	(my_str_indexof(ret, '\n') == -1)\n"
	  "{\n"
	  "if ((n = read(fd, buff, READ_SIZE)) <= 0)\n"
	  "{\n"
	  "if (n == 0)\n"
	  "return NULL;\n"
	  "return ret;\n"
	  "}\n"
	  "buff[n] = '\0';\n"
	  "ret = _my_gnl_append(ret, buff);\n"
	  "}\n"
	  "my_strcpy(ret + 1 + my_str_indexof(ret, '\n'), buff);\n"
	  "ret[my_str_indexof(ret, '\n')] = '\0';\n"
	  "return ret;\n"
	  "}\n"
	  )
  )
