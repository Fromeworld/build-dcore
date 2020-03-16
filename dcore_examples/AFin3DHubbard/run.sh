python mk_hr.py
python mk_init_se.py

export MPIRUN="mpirun"
dcore_pre cubic.ini > output-pre
dcore cubic.ini --np 48 > output
dcore_post cubic.ini --np 48 > output-post