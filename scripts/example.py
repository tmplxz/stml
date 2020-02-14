from stml.data_access import Chess_Handler
from stml.validation import Validation
from stml.helpers import ConsoleOutput
from stml.methods import get_method


kfolds = 2
shuffle = False
hide_amount = 0.2
hide_method = 'spatial_clouds'
cpus = 1
emiters = 1
method = 'LIN'
config = ''

cons = ConsoleOutput(kfolds, cpus)
data = Chess_Handler(None, None)
valid_handler = Validation(data, kfolds, shuffle, hide_amount, hide_method, cons)
method_handler = get_method(method, config, valid_handler, cons, emiters)
method_handler.run(kfolds, cpus)
