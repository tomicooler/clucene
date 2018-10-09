MACRO ( DEFINE_LONGLONG_SYNTAX ) 
    #check how to define a long (and longlong number)
    CHECK_CXX_SOURCE_COMPILES("int main(){ int x = (int)(1234LL); }" _CL_ILONGLONG_LL)
    IF ( _CL_ILONGLONG_LL )
	SET(_CL_ILONGLONG_VALUE "(long long) x ## LL")
    ELSE ( _CL_ILONGLONG_LL )
        CHECK_CXX_SOURCE_COMPILES("int main(){ int x = (int)(1234i64); }" _CL_ILONGLONG_i64)
        IF ( _CL_ILONGLONG_i64 )
            SET(_CL_ILONGLONG_VALUE "x ## i64")
        ELSE ( _CL_ILONGLONG_i64 )
            MESSAGE( FATAL_ERROR "_CL_ILONGLONG_VALUE could not be determined" )
        ENDIF ( _CL_ILONGLONG_i64 )
    ENDIF ( _CL_ILONGLONG_LL )
ENDMACRO ( DEFINE_LONGLONG_SYNTAX ) 
