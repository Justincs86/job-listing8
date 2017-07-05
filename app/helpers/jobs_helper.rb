module JobsHelper
  def render_job_status(job)
      if job.is_hidden
        content_tag(:span, "", class: "fa fa-lock fa")
      else
       content_tag(:span, "", class: "fa fa-globe fa")
      end
    end

end
