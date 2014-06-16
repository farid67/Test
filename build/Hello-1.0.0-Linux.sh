#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --prefix=dir      directory in which to install
  --include-subdir  include the Hello-1.0.0-Linux subdirectory
  --exclude-subdir  exclude the Hello-1.0.0-Linux subdirectory
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "Hello Installer Version: 1.0.0, Copyright (c) Vendeur anonyme"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage 
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version 
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
LICENSE
=======

This is an installer created using CPack (http://www.cmake.org). No license provided.


____cpack__here_doc____
    echo
    echo "Do you accept the license? [yN]: "
    read line leftover
    case ${line} in
      y* | Y*)
        cpack_license_accepted=TRUE;;
      *)
        echo "License not accepted. Exiting ..."
        exit 1;;
    esac
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the Hello will be installed in:"
    echo "  \"${toplevel}/Hello-1.0.0-Linux\""
    echo "Do you want to include the subdirectory Hello-1.0.0-Linux?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/Hello-1.0.0-Linux"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

tail $use_new_tail_syntax +147 "$0" | gunzip | (cd "${toplevel}" && tar xf -) || cpack_echo_exit "Problem unpacking the Hello-1.0.0-Linux"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;

� �1�S �[p�y{����ȶlT����ǀc#���' l�7���n�i����EJj���a�4a����ԭ����mC��#l7wBS�a�u�?��C<LC�~�{�{�v���}����{������}{13ڴ��kٚrͨ������B����,ƌZ��Җ�m��흭m����sA3��׮IYJَjASTK�]�a��/ԏ?!��2�i]�%&�״�px�K�pY������=B�G��Z�Ac�J��E4\5��zButӠ�v-JS�Fz��ꖮ��C�Hi�1��@J��f�TM&���B̐f84aZ6�J�ֆAp
k�.�WY�&GO�6���5���]�b�L��^݈���.�F}(iZ�
��rK��Y۳���G�ټ~݆>e%l��4�6Mh;�kЫێq��9�R;	��0��9Dc)��$DM�����lZK$x�)�5��0g����v�4��8��)j��5�p��E���Ύ�f�4M�]�wl:]��jʡ8�B�# �H����T�8V���vh�/�4j�>��,��-��)�6�$���o%M��,��jp���;���ٚeA�m�.:�|e��W7R��h����)�Fl3�D�̍>Yp]���7z'}2ɶ�M����T݈D���9��o�;�t.�(��׃f�F4����l'��u8Mp9�F|R��(l̸jѹ�}��9�?���Š5�Y.�4'e�yq���]�	#���>nb���s����������M=F����=i�I0�(������S��x����k#���GK������������6@�z6����:\�]6�w�NL7#�r�`���CB,%��)8p�Ц&�_��Z�'y�	^�!b�ba],7�����<j�P�jh\AQ�
�[��%�T�L�a�®���*g��z-���=Y=��>\9�6hꮼ�P��m
���:Fs���Y3b���8K�u�������������֎�6w�/�����Z���z�C=��%I�� 	��Cm͛���%e��ԑ����v�J M���|�n9�a
�S�<���,�C���I5ϗ� �C�!�B�����k!�i�1��20����L�[��;�#{��6�?^�g!��Xy�o�|�}� ��?�BM��'Ш��H+ϫv�W���5���-[��W~�V�~���g��~=�sV����	�yc<+�TM҇�B�4q�,/���+giϿ��V������Y���O}��?��ןh���ۛ��>w���u����y���濞8�o�V���Jx�Z~2��y��yx�tD�i{/��>_K�!��_�)��=�����)ħ`]�L�Dr
�{8������O���"���d�+��=�/'?�x	���'!޹�ˇ�yu�r�U�(�C�����(
QVoW6h��rЬ�jۚM�CFq!te�:_�����ԁYn�V��ꨐ�o�<����<�\1Q;���]�x�g3!������]��[i�x�0��tտE��=6޺>˼���a������ ��1T���������N%�@�R&��s�)��co��P0}2�e4۳L�E�93��a>O��(�]dϼ5df��8�9�x��f�9l�����U�����6�q���>{O��؏p�`m��&4U��i��Rw���x5H�}��?��@����}�ȳ؈�	�B25{0�����^(�
��Iy���g��l�C��s�Gk ����l��p�^�0-s�G��h��thˇ�l��g���G�����H44����7/g2#i|���s����3�������?�a���<�A,g��B�/H/��3}�n�}��ѳs��ף�F���x.�/f�)��i�`���9u I����snފ��s�7�V[�HS��q��F!��4�*	q3�qIA�g�w ~��sI��"�IS+dy��Ϥ:/�o&�������y��}�⹭���y��,<'HWehO`�Ē��C-��I_�p�U?��������rWeM�dmes`ue$�B� y��R~��(��}�i?�4��o�"�HE*R���{^�I�k+��R�t��\ΘO�n���yi��"�+rm8!��n�ɭ�3s��=���j}�$ԋ��n���)n�s%�C�Ll�y�\���R��l�W��� | Թ��{m�ԟ2�TS�n��I�"��[R,�}�	��q۱��Dt�$���E����糖.7h�"�)Tb=FW�8��v��!;�ٮY�n9�y��@H&�J�ц�?�j"��t��W,uHS�1+ˑH�1-��h[�b��!=
�L���u�z@�B�~��;�/�=��5��H|>=���6��1[�{G�ȻNp� �wن8�a| �q�6���]�D�a��m#�p�V����m�g�XN��E��yA������������l�y�<�7l!|=�3��2�(i�2o\ ��^���-�p%e��W!�v������ #R`�p' wB満G�.�+��@�N)��O�ᙱn+ ��]/h�8T�۝����c��R>����
�W �
�N�}���3[VUa�+�P���C��jMU6O�=�	��*k��pX�KB}h?8_�>?px�^��� wZ�h�Յ���|��Ռ�{ݭϳ� n���!A!�.�����(r7M����_�������m���k��-�:;����A����k�:�ϖ����H#�'ӮX��Jx��xFTL�A���<�=�|:��&<���)�]� ���	s�l���b��w������m�+����Hz��;�I�z�{��Y���=��P�DN.)�4|W�=m�h���@{;������z�)�I��@!|*����r��h����!N@�fn�ޚ���U[ГWFn������
K�k&��谊�jB��vU#x2�آ%|Cw�I��B{O-x�d~*B�-��K�m�A���4{�^�%������c��6}c��<�2\f��m��٪��m�=[���3c�Wڪ�2�`řc��$so*����T�WÕ��Wo���=�����wQx�wg(��@�oG�4����c�Cʁ4N��3�<�E���]�ߑ���o���`����_f�y��X��>Y�徭�h��0�ǧ����5�ԟ87�6������!s*}�f�Vn$�ᚱw!o��N(>���ࠝ2Z��
{;��Y���/P�ȋ�֑g�q���X��A�r)�/c;�9���F=۲�a��Z��!�g^��L>܎�vy|;2b0��b��������]P��HE*R��T�"�H7����N�J~$��uԕ��:��p�}kp]Б���(���mj���ɵ���� ��(ɵ����U���,�����P��h/���?r}����̿bઢ�az�P6_��$=ꪖy~��B{0
L�4Od��_e�%�q���pH T�&�&�3d�!�|���<���4I�Y9�<X9I�,U��Hy�]� u��0�r��]�\T���Kpu�z��M�~[9�K�)OjڮZ��m�q�n�M���vR�jM���w�����&�{X�6lJ�ΛB�(��?V��Ov�i94e�����(O�'�4���_p��M�۝O?�%�]��(;�g̈́��3�s*��,�/���c�y�</Q�_���Ĵ�Ԡ�Z�1�������oi�=.����z�&����@��}B���#o
PU�|BxNa��d�ў��k�|Bx~ax�����[B�>!<�0<*��Τ�$���
�͂\�'�_�z>!<�04��EB�����s����C�U�..,ඓ�o�s�|B�d��%��	�>&��bh,�}G���P�'������<L,0��hͯ�	WW�C� �ω�#�����|-�j W3�YW��q|B�I�'���U�&,8���P��ƪ�;Y�Ï�w��	�D�/�P]�}�I�'����q|B�$�>��q|Bo�\���\߯���<���.�÷���%��U��j'�=���*��c���Ǭ��fM�gI~}x�}`��E��e�^�I;�>p���;����;�����7���;9�%;>�%4<���>�=�/�<�`^�y��>;�8�WL�ϗ�8���@O�|9�=[|�]����{"�x<w-��<���b���S�����;�|�}�����Wc>�-�|�݂���7����o!"sv �����S���<�����s�]&�epļ�K��P��H#��_������`�?�����[�2k��~��Y��,>_>ޝ���!�Y��U�ky�M��l}�W~�=(��V��/Hv>$��3$;���d�������A���$t}S����%�X�z)�״Y��Em͓������"Q˱��� �t��o��w��>�B)�r���3���ٯ&v�S��0��&4G�E:Z��P��0p-��
c��������X]�7t���9�=g�D})�\Q�;:"���$��O�G���F�ئW�XB#ʲϭ�Z���(+z�-��U�-_���O��Z�ۣ�޲N�%KD�zٲ)���;O!`���[�w��HE*R�� �� ,�� P  