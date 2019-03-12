# COMANDOS NO GIT

## INICIANDO GIT
Inicializando git em uma pasta.
> ``git init``
--------------------------------------

## CONFIGURANDO NO GIT
>``git config --global user.name ...``  
>``gut config --global user.email ...``  
>``git config --global core.editor...``  

--------------------------------------

## GERANDO REGISTRO NO GIT (CHECKPOINT)
### Adicionando untracked -> tracked 
* Um arquivo
> ``git add ...(nome do arquivo)...``
* Todos os arquivos
> ``git .add`` 
### Adionando tracked -> committed
> ``git commit -m "messagem"``
### Shortcut dos dois comandos anteriores
> ``git commit -am "mensagem"``

--------------------------------------

## VERIFICAR ALTERACOES
### Mostrar alteracoes especifica
> ``git show ...(nome da hash)...``
### Mostra ultima alteracao (sem commit)
> ``git diff``
### Mostra arquivos que sofreram alteracao
> ``git diff --name-only``

--------------------------------------

## CORRIGIR ALTERACOES
### Retornar o arquivo editado para versão anterior (Untracked)
> ``git checkout ...(nome arquivo)...``
### Retornar o arquivo editado para versão anterior (tracked) ---> (Untracked)
> ``git reset HEAD ...(nome arquivo)...``
### Retornar o arquivo editado para versão anterior (commited) ---> (tracked) - Soft * Escolher sempre um hash antes da versão para descartar
### Remover commit feito e a mensagem
> ``git reset --soft ...(hash)...``
### Retornar o arquivo editado para versão anterior (commited) ---> (modified or untracked) - mixed
### Bom para ver as alteracoes e possivel de fazer checkout
> ``git reset --mixed ...(hash)...``
### Retornar o arquivo editado para versão anterior (commited) ---> (delete all) - hard
### remove todo o checkpoint (cuidado com push) e conflito
> ``git reset --hard ...(hash)...``
### remove primeiro commited
> ``git update-ref -d HEAD``

--------------------------------------

## BRANCH
### Criar brach e vai para o novo branch
> ``git checkout -b '...(nome)...'``
### Listar
> ``git branch``
### Ir para um certo branch
> ``git checkout ...(nome)...``
###Deletar branch
> ``git branch -D ...(nome)...``
### Merge
> ``git merge ...``
### Rebase
> ``git rebase ...(branch nao master)...``

--------------------------------------

## Contribuição
### Mostra o nome as ações add, commited, branch...
> ``git shortlog ``
### Só mostra o nome com contribuição
> ``git shortlog -sn``
### Especifico e detalhado
> ``git log --decorate ou git log``  
> ``git log --author="..."``
### Grafico
> ``git log --graph``

--------------------------------------

## GITHUB
### Criando repositorio
> ``echo "# git-course" >> README.md``  
> ``git init``  
> ``git add README.md``  
> ``git commit -m "first commit"``  
> ``git remote add origin ``  
> ``git@github.com:christianmaekawa/git-course.git``  
> ``git push -u origin master``  

## Exportando do local
>``git remote add origin ``  
>``git@github.com:christianmaekawa/git-course.git``  
>``git push -u origin master``  

## Identificando o git remoto 
>``git remote``
## Mais informacoes 
>``git remote -v``

## Atualizar github com modificacao no git (origin pode ser diferente)  (master eh o brach)
> ``git push origin master ``

## Importar para o git local (segundo eh o nome do clone) * Ja esteja na pasta que queira dar clone
>``git  clone git@github.com:christianmaekawa/git-course.git``  
>``git-course-clone``

--------------------------------------
## Working progress... need backup

> ``git stash``
### Import backup 
> ``git stash apply``
### Mostra lista
> ``git stash list``
#Limpa os backup
> ``git stash clear``

--------------------------------------

## SHORTCUT ALIAS
### troca status por s
> ``git config --global alias.s status``

## TAG Versão marcar como algo significativo
### Adicionando TAG
> ``git tag -a 1.0.0 -m "Readme finalizado"``
### Update para github
> ``git push origin master --tags``

--------------------------------------

## EXTRA
### Mostrar ramo ate o arquivo
>``ls -la``
### Gerar chave publica SSH
Primeira vez para confirmar pasta (ENTER)  
Segunda vez eh a senha terceira repetir senha (ENTER 2x)
> ``ssh-keygen``
### Encontrar chave publica
> ``~/.ssh``  
>``cat nomeDaChave.pub``  
>``more ...(nome da chave)...`  


### Ignorar arquivos
> ``vim .gitignore``
### Mostrar o caminho
> ``pwd``

