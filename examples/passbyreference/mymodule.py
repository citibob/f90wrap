import _mymodule
import f90wrap.runtime

class Mymodule(f90wrap.runtime.FortranModule):
    """
    Module mymodule
    
    
    Defined at mycode.F90 lines 3-23
    
    """
    class Mytype(f90wrap.runtime.FortranDerivedType):
        """
        Type(name=mytype)
        
        
        Defined at mycode.F90 lines 7-9
        
        """
        def __init__(self, handle=None):
            """
            self = Mytype()
            
            
            Defined at mycode.F90 lines 7-9
            
            
            Returns
            -------
            this : Mytype
            	Object to be constructed
            
            
            Automatically generated constructor for mytype
            """
            f90wrap.runtime.FortranDerivedType.__init__(self)
            self._handle = _mymodule.f90wrap_mytype_initialise()
        
        def __del__(self):
            """
            Destructor for class Mytype
            
            
            Defined at mycode.F90 lines 7-9
            
            Parameters
            ----------
            this : Mytype
            	Object to be destructed
            
            
            Automatically generated destructor for mytype
            """
            if self._alloc:
                _mymodule.f90wrap_mytype_finalise(this=self._handle)
        
        @property
        def val(self):
            """
            Element val ftype=double precision pytype=unknown
            
            
            Defined at mycode.F90 line 8
            
            """
            return _mymodule.f90wrap_mytype__get__val(self._handle)
        
        @val.setter
        def val(self, val):
            _mymodule.f90wrap_mytype__set__val(self._handle, val)
        
        def __str__(self):
            ret = ['<mytype>{\n']
            ret.append('    val : ')
            ret.append(repr(self.val))
            ret.append('}')
            return ''.join(ret)
        
        _dt_array_initialisers = []
        
    @staticmethod
    def mysubroutine(a, b, tt):
        """
        mysubroutine(a, b, tt)
        
        
        Defined at mycode.F90 lines 13-23
        
        Parameters
        ----------
        a : unknown
        b : unknown
        tt : Mytype
        
        """
        _mymodule.f90wrap_mysubroutine(a=a, b=b, tt=tt._handle)
    
    _dt_array_initialisers = []
    

mymodule = Mymodule()

