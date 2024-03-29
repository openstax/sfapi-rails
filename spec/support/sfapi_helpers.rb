require 'openstax/salesforce/spec_helpers'


# Adds a convenience method to get interpret the body as JSON and convert to a hash;
# works for both request and controller specs
class ActionDispatch::TestResponse
  def body_as_hash
    @body_as_hash_cache ||= JSON.parse(body, symbolize_names: true)
  end
end

def disable_sfdc_client
  allow(ActiveForce)
    .to receive(:sfdc_client)
          .and_return(double('null object').as_null_object)
end


def oxa_dev_cookie
  @oxa_dev_cookie = 'oxa_dev=eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..zdpEdwgWJFxMhsSj.TlQEGSWHdrH6KHhYSR9zQvVhjFGNOuXjWWmuRbK5UUVHePTfI-W_dR-x2ObCoqVarew7FR6h1p_E4Ddk5bA9vH5-v6PNqTOlGuDwqs1x6GjA9yzYMsALGryXlXwE1kaMDSbt9XDUD5Sv2yfYcL_5g3Dan_H5WH8wad9Zqm8ziNDfwEvSTzRXe9W_Wgr7Nto9HWtzko8VE7pm0_mgYoUjtQxN_kDDca-6NSKEeldGQK-IpQY6OMjinVwPbea6iA23ZOM3U1TJmKirWtYt7mnpfn9X8LYQp9OVniWFJGLiy1x7lUdBspPSePJgWGihQM7GfG8HHRGJPhlbSFzYu3FbEi2BH2OmQ3UXEN6J1IGBPKwQe2xaZxRDKGGV9t9CUDfaSvP6SXU8qRFwB4TM1EtyaKOgjwunq2tUk_h7UDF2gfyKFByT5__fCghWk-Ex1vjpymCKTRLZXD9pSpmZXxRbxD-g9u32BFcefcMN2xzFhV19_VX6nha2MYsnpM2gTR6wuwhtz-LCNsVHeoVyW4rDhxQDsquVXYBszNckr8f_ENkLf8BfF9dCh75WicNt8SzZkoK8_NO3IRJkbjSePE1rjptIxSGxdG8PYWqyoNGdKGEXKGSRzSBY-Qha84MXWrpx7kuejVVwl6Sw0pGNLJIX9bM6JAxWKa9xdTWe09mQ0fdJHjT6NyoSxe4JxqFm8CL4uv-JrwwS9TXVtDxi0iUe7E3bTRprwsugTb2K-WfLNJBz0IxNt3YGaLeXdhmEcTHpkoiaMqYQfhTZmD5vKSCX925Ky-eAnn4TGQgJYbppvpX6hveeEpzaifgD-69HETri-ie6zgpiXlBsXlKbmhdSs8QDWYF-3E5YAZyHFEY7Cr6_Tmby6ibjZUbdjfWJkii52UaE2sQWCUQt9S2Kl4wtd7FAyUD9e2ATEETPBqTXkZ8L0gJ7wOksah5_96uARpnIibHiYJ_IbYQZazssgmPLb5XXRuBroq1HFSA6HkaK3YJEYBXrPMNMMHPQk37qrdXUxdnDQBLoKCFqBkSTc9e6_9EXseOjpx3mfIPSehXJmnMtCPxUFJO_8QaPKyGXpxA3vYyYMUY7Q_Ai19AEG3YqzHQOdk2nQTQvA_jvBQCXWXAEh_rNgMM0IdhWO_Awxqa2zOnIoJuFGorbgPYS8ZZbo1RVtqY_AAzojReDopJz60NH9T5ltD4u2TgfRRSBRem9_g1gQLun5SiHr99-RvrqiA6iTzZyGKeOanf1HL8CdSUtBNVWkmn1SqRXZcWTk6pFACJM67YPeCvuJn5zjjCG815axqdbdDqNEAtQRKKsHnmeIDJEgPUfiAYG9lN5DrGngqr33GN5HL47xs3JXXX6LK8_WKueHoeEdW_-KFCzr02gvZPAgIJR0LwKI2XYGajtVitaP-VKyW2sbH_vkaTlu6bKtwtQon1191etd7Q78AnW6Rm7h6ZJwAS9AbR8CUEqK70O5nHYBYRJw-vcQzZKpiTvTSw75rbM-sF_rdYR8mUOyXBlsJbCB_R6hkAXdoD16ZC4BA1ZvLB2jJm7lS4AhVd_7iR8a1kBHVZnI28B_ruZE3jqFFa7FurjgDnnnyfdU6W0-uQ2DHC5fk4DjSU18Y_7eRFfWIu85PmknW5ma4KYoQO7-o714njGRPsB0mFja_UFBsp1_trNkwUjEJ9mvJQMM4ZW9aD_097SF71IaANCh0xI1c5N7zBip9cUOe8lFttQIdI9ns9DUgeE1WDMWvBPUKDO6dnYhjIMZje2sAx6DtPA5ldiIuVYN5S7D3eVgxubQn43HXJJuomhVVlOHOwbyHLjBMuUT7f3dLzXGHbLIQtnW9-sHl1xnU_R7McslkghQMmk79YPo2J6iypnVpppZba-YqvcWqxh5YLYC9JAC-_-WaRyEQ18t3JOBcBma8B0a85zICyO187-cSbFObL3ZIt02ZP7624CpFce31NMa9-Sk09ulssD31S-l0YBz148uWAtGWbbbzJhEQdVyRtL6sSxfQQKPylE5xyjQC8BqOwZ1iMt62BTH8CQuFQgnzeJ2kC9fZMMbNs.LaO7JKdkUrINwub8EM0sTA'
end

module SFAPISupport
  class SFSpecHelpers

    extend OpenStax::Salesforce::SpecHelpers

    def self.salesforce_books
      @proxy.books
    end

    def self.a_book_from_salesforce
      @book_from_sf ||= salesforce_books[0]
    end

    def self.salesforce_schools
      @proxy.schools
    end

    def self.a_school_from_salesforce
      @school_from_sf ||= salesforce_schools[0]
    end

    def self.create_contact
      @proxy.ensure_schools_exist(['RSpec University'])
      @sf_contact = @proxy.new_contact

      @contact = Contact.cache_local(@sf_contact)
    end

    def self.create_school
      @school = @proxy.ensure_schools_exist(['RSpec University'])
    end
  end
end
