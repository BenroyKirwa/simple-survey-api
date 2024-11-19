from django.template.library import Library
register = Library()

@register.filter
def get(dictionary, key):
    """
    Gets a dictionary value by key safely.
    """
    if isinstance(dictionary, dict):
        return dictionary.get(key, '')
    return ''

@register.filter
def mul(value, arg):
    """
    Multiplies the arg and the value
    """
    try:
        return int(value) * int(arg)
    except (ValueError, TypeError):
        return 0

@register.filter
def div(value, arg):
    """
    Divides the value by the arg
    """
    try:
        return int(value) / int(arg)
    except (ValueError, TypeError, ZeroDivisionError):
        return 0