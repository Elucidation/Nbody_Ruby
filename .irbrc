#  .irbrc

    # This is the definition of the default prompt:
    # 
    #    IRB.conf[:PROMPT_MODE][:DEFAULT] = {
    #          :PROMPT_I => "%N(%m):%03n:%i> ",
    #          :PROMPT_S => "%N(%m):%03n:%i%l ",
    #          :PROMPT_C => "%N(%m):%03n:%i* ",
    #          :RETURN => "%s\n"
    #    }
    #
    # This short version leaves out the first two parts.
    #
    # usage: irb --prompt short_prompt

    IRB.conf[:PROMPT][:SHORT_PROMPT] = {
          :PROMPT_I => "%03n:%i> ",
          :PROMPT_S => "%03n:%i%l ",
          :PROMPT_C => "%03n:%i* ",
          :RETURN => "%s\n"
    }