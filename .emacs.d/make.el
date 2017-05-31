;;
;; make.el for  in /home/praxy/.emacs.d
;; 
;; Made by AntoineV
;; Login   <praxy>
;; 
;; Started on  Fri May  5 11:50:18 2017 AntoineV
;; Last update Fri May  5 12:32:36 2017 AntoineV
;;

(global-set-key (kbd"C-x C-w") 'insert-make)

(defun insert-make ()
  (interactive)
  (insert (get-make))
  (forward-line -28)
  )

(defun get-make ()
 (setq str (read-from-minibuffer
                    (format "Binary name of the Makefile : ")))
  (concat "CC\t=\tgcc \n\n"
	  "NAME\t=\t" str "\n\n"
	  "SRC\t=\t\n\n"
	  "OBJ\t=\t$(SRC:.c=.o)\n\n"
	  "CFLAGS\t=\t-I./includes/ -W -Wall -Wextra -pedantic\n\n"
	  "RM\t=\trm -fr\n\n"
	  "all\t:\t$(NAME)\n\n"
	  "$(NAME)\t:\t$(OBJ)\n\n"
	  "\t\t$(CC) -o $(NAME) $(OBJ)\n\n"
	  "clean\t:\n\n"
	  "\t\t$(RM) $(OBJ)\n\n"
	  "fclean\t:\tclean\n\n"
	  "\t\t$(RM) $(NAME)\n\n"
	  "re\t:\tfclean all\n\n"
	  ".PHONY\t:\tall clean fclean re\n\n"
	  )
  )
